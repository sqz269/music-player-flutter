import 'package:flutter/material.dart';

import 'package:BackendClientApi/api.dart';

import 'package:get/get.dart';
import 'package:tlmc_player_flutter/components/track_tile.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';
import 'package:tlmc_player_flutter/states/root_context_provider.dart';
import 'package:tlmc_player_flutter/utils/utils.dart';

class AlbumPageController extends GetxController {
  final String albumId;

  var masterAlbum = Rx<AlbumReadDto?>(null);
  var allTracks = Rx<List<TrackReadDto?>>([]);
  var albumsData = <AlbumReadDto>[].obs;
  var isLoading = true.obs;

  AlbumPageController({required this.albumId});

  @override
  void onInit() {
    super.onInit();
    initAlbums();
  }

  Future<void> initAlbums() async {
    var albumApi = AlbumApi(Get.find<ApiClient>());

    var album = await albumApi.getAlbum(albumId);

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
}

class MobileAlbumPage extends StatelessWidget {
  final Map<String, String?> routeParams;
  const MobileAlbumPage({super.key, required this.routeParams});

  List<Widget> buildTrackViews(BuildContext context) {
    var controller = Get.find<AlbumPageController>();

    var trackViews = <Widget>[];

    for (var album in controller.albumsData) {
      var discName = 'Disc ${album.discNumber}';
      if (album.discName != null) {
        discName = album.discName!;
      }

      album.tracks?.forEach((element) {
        controller.allTracks.value?.add(element);
      });

      trackViews.addAll(
        [
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
    if (controller.albumsData.length > 1) {
      var trackSum = 0;

      for (var album in controller.albumsData) {
        trackSum += album.tracks!.length;
      }
      trackSummaryText =
          "${controller.albumsData.length} discs · $trackSum tracks";
    } else {
      trackSummaryText =
          "${controller.albumsData[0].tracks!.length} tracks · ${Util.sumTimeStr(Util.getTrackDurationList(controller.albumsData[0].tracks!))}";
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

  @override
  Widget build(BuildContext context) {
    // var albumId = Get.parameters['albumId'];
    var albumId = routeParams['albumId'];

    AlbumPageController controller;
    // is there an existing controller?
    if (Get.isRegistered<AlbumPageController>()) {
      if (Get.find<AlbumPageController>().albumId != albumId) {
        Get.delete<AlbumPageController>();
        controller =
            Get.put(AlbumPageController(albumId: albumId!), permanent: false);
      } else {
        controller = Get.find<AlbumPageController>();
      }
    } else {
      controller =
          Get.put(AlbumPageController(albumId: albumId!), permanent: false);
    }

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(),
            SliverToBoxAdapter(
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Display album image
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(controller.masterAlbum
                                      .value!.thumbnail!.large!.url!),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Display album title
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 36.0),
                              child: Text(
                                controller
                                    .masterAlbum.value!.albumName!.default_,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
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
                                IconButton.outlined(
                                  onPressed: () {},
                                  icon: const Icon(Icons.library_add_outlined),
                                ),
                                IconButton.filled(
                                  onPressed: () {
                                    var trackCount = controller
                                        .allTracks.value.length
                                        .toString();
                                    QueueController.to
                                        .addTracksById(
                                            controller.allTracks.value
                                                .map((e) => e!.id!)
                                                .toList(),
                                            playImmediately: true)
                                        .then(
                                      (value) {
                                        ScaffoldMessenger.of(RootContextProvider
                                                .to.rootContext!)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Added $trackCount tracks to queue'),
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.play_arrow),
                                  iconSize: 42,
                                ),
                                IconButton.outlined(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                            ...buildTrackViews(context),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
