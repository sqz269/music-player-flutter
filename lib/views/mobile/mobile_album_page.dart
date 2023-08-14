import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:BackendClientApi/api.dart';

import 'package:get/get.dart';
import 'package:tlmc_player_flutter/components/track_tile.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';
import 'package:tlmc_player_flutter/states/root_context_provider.dart';
import 'package:tlmc_player_flutter/utils/utils.dart';

// class AlbumPageController extends GetxController {
//   final String albumId;

//   AlbumPageController({required this.albumId});

//   @override
//   void onInit() {
//     super.onInit();
//   }
// }

class MobileAlbumPage extends StatefulWidget {
  final Map<String, String?> routeParams;
  final String albumId;

  MobileAlbumPage({super.key, required this.routeParams})
      : albumId = routeParams['albumId']! {
    print("MobileAlbumPage SW Init");
  }

  @override
  State<MobileAlbumPage> createState() => _MobileAlbumPageState();
}

class _MobileAlbumPageState extends State<MobileAlbumPage> {
  var masterAlbum = Rx<AlbumReadDto?>(null);
  var allTracks = Rx<List<TrackReadDto?>>([]);
  var albumsData = <AlbumReadDto>[].obs;
  var isLoading = true.obs;

  final sliverAlbumControlKey = GlobalKey();

  var albumInfoOpacity = 1.0.obs;

  var scrollController = ScrollController();

  @override
  void initState() {
    print("MobileAlbumPage SW initState");
    // TODO: implement initState
    super.initState();

    initAlbums().then(
      (value) {
        scrollController.addListener(onScroll);
      },
    );
  }

  void onScroll() {
    var combinedHeight =
        kToolbarHeight + sliverAlbumControlKey.currentContext!.size!.height;

    var offset = scrollController.offset;

    if (offset < 0) {
      albumInfoOpacity.value = 1.0;
      return;
    }

    if (offset > combinedHeight) {
      albumInfoOpacity.value = 0.0;
    } else {
      albumInfoOpacity.value = 1.0 - (offset / combinedHeight);
    }
  }

  Future<void> initAlbums() async {
    var albumApi = AlbumApi(Get.find<ApiClient>());

    var album = await albumApi.getAlbum(widget.albumId);

    if (album == null) {
      throw Exception('Album is null');
    }

    if (album.numberOfDiscs! > 1) {
      // fetch all discs
      for (var child in album.childAlbums!) {
        var childAlbum = await albumApi.getAlbum(child.id!);

        if (childAlbum == null) {
          throw Exception('Child album is null');
        }

        albumsData.add(childAlbum);
      }

      masterAlbum.value = album;
    } else {
      masterAlbum.value = album;
      albumsData.add(album);
    }

    for (var data in albumsData.value) {
      // sort the tracks
      data.tracks!.sort((a, b) => a.index!.compareTo(b.index!));
    }

    isLoading.value = false;
  }

  List<Widget> buildTrackViews(BuildContext context) {
    var trackViews = <Widget>[];

    for (var album in albumsData) {
      var discName = 'Disc ${album.discNumber}';
      if (album.discName != null) {
        discName = album.discName!;
      }

      album.tracks?.forEach((element) {
        allTracks.value.add(element);
      });

      trackViews.addAll(
        [
          if (albumsData.length > 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    discName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                  ),
                ],
              ),
            ),
          // Divider(),
          ListView.builder(
            padding: const EdgeInsets.only(top: 0),
            itemBuilder: (context, index) {
              return TrackTile(
                  trackData: album.tracks![index], albumData: album);
            },
            itemCount: album.tracks!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        ],
      );
    }

    var trackSummaryText = "";
    if (albumsData.length > 1) {
      var trackSum = 0;

      for (var album in albumsData) {
        trackSum += album.tracks!.length;
      }
      trackSummaryText = "${albumsData.length} discs · $trackSum tracks";
    } else {
      trackSummaryText =
          "${albumsData[0].tracks!.length} tracks · ${Util.sumTimeStr(Util.getTrackDurationList(albumsData[0].tracks!))}";
    }

    var trackSummary = Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Center(
        child: Text(trackSummaryText),
      ),
    );

    trackViews.add(trackSummary);

    return trackViews;
  }

  Widget buildAlbumControls(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width * 0.7;

    return Padding(
      key: sliverAlbumControlKey,
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Display album image
          Container(
            width: imageWidth,
            height: imageWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(masterAlbum.value!.thumbnail!.large!.url!),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 16),
          // Display album title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Text(
              masterAlbum.value!.albumName!.default_,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          // controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.library_add_outlined),
              ),
              IconButton.filled(
                onPressed: () {
                  var trackCount = allTracks.value.length.toString();
                  QueueController.to
                      .addTracksById(
                          allTracks.value.map((e) => e!.id!).toList(),
                          playImmediately: true)
                      .then(
                    (value) {
                      ScaffoldMessenger.of(RootContextProvider.to.rootContext!)
                          .showSnackBar(
                        SnackBar(
                          content: Text('Added $trackCount tracks to queue'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.play_arrow),
                iconSize: 42,
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var albumMiscInfo = Obx(
      () => isLoading.value
          ? const SizedBox.shrink()
          : GestureDetector(
              onTap: () {
                print("Navigate to circle page");
                Navigator.pushNamed(
                  context,
                  '/circle',
                  arguments: {
                    'circleId': masterAlbum.value?.albumArtist![0].id,
                  },
                );
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: masterAlbum.value!.albumArtist![0].name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: "\nAlbum",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                    TextSpan(
                      text: ' · ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                    TextSpan(
                      text: '${masterAlbum.value!.releaseDate!.year}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Obx(
          () => AppBar(
            primary: true,
            elevation: 0.0,
            backgroundColor: Theme.of(context)
                .colorScheme
                .background!
                .withOpacity(1 - albumInfoOpacity.value),
            forceMaterialTransparency: albumInfoOpacity.value == 1,
            title: Opacity(
              opacity: 1 - albumInfoOpacity.value,
              child: Text(
                isLoading.value
                    ? "Loading..."
                    : masterAlbum.value!.albumName!.default_,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            Obx(
              () => SliverToBoxAdapter(
                child: SizedBox(
                  height: 56,
                  child: isLoading.value
                      ? const Center(
                          child: SizedBox.shrink(),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: albumMiscInfo,
                        ),
                ),
              ),
            ),
            Obx(
              () => SliverOpacity(
                opacity: albumInfoOpacity.value,
                sliver: SliverToBoxAdapter(
                  // key: controller.sliverAlbumControlKey,
                  child: Obx(
                    () => isLoading.value
                        ? const Center(
                            child: SizedBox.shrink(),
                          )
                        : buildAlbumControls(context),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: buildTrackViews(context),
                      ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Obx(
      //   () => Opacity(
      //     opacity: 1 - albumInfoOpacity.value,
      //     child: FloatingActionButton.extended(
      //       onPressed: () {
      //         // Add your onPressed code here!
      //       },
      //       label: const Text('Play'),
      //       icon: const Icon(Icons.play_arrow),
      //       backgroundColor: Colors.white,
      //     ),
      //   ),
      // ),
    );
  }
}
