import 'package:flutter/material.dart';

import 'package:BackendClientApi/api.dart';

import 'package:get/get.dart';
import 'package:tlmc_player_flutter/components/track_tile.dart';
import 'package:tlmc_player_flutter/utils/utils.dart';

class AlbumPageController extends GetxController {
  final String albumId;

  var masterAlbum = Rx<AlbumReadDto?>(null);
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
  const MobileAlbumPage({super.key});

  List<Widget> buildTrackViews() {
    var controller = Get.find<AlbumPageController>();

    var trackViews = <Widget>[];

    for (var album in controller.albumsData) {
      var discName = 'Disc ${album.discNumber}';
      if (album.discName != null) {
        discName = album.discName!;
      }

      trackViews.addAll(
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  discName,
                  style: Theme.of(Get.context!).textTheme.titleMedium,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                ))
                // Row(
                //   children: [
                //     IconButton(
                //       onPressed: () {},
                //       icon: const Icon(Icons.library_add_outlined),
                //     ),
                //     IconButton(
                //       onPressed: () {},
                //       icon: const Icon(Icons.play_arrow),
                //       iconSize: 42,
                //     ),
                //     IconButton(
                //       onPressed: () {},
                //       icon: const Icon(Icons.more_vert),
                //     ),
                //   ],
                // ),
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
    var albumId = Get.parameters['albumId'];

    AlbumPageController controller;
    // is there an existing controller?
    if (Get.isRegistered<AlbumPageController>()) {
      if (Get.find<AlbumPageController>().albumId != albumId) {
        Get.delete<AlbumPageController>();
      }

      controller = Get.find<AlbumPageController>();
    } else {
      // Get.lazyPut(() => AlbumPageController(albumId: albumId!), fenix: true);
      // var controller = Get.find<AlbumPageController>();
      controller =
          Get.put(AlbumPageController(albumId: albumId!), permanent: false);
    }

    return Obx(
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
                        image: NetworkImage(controller
                            .masterAlbum.value!.thumbnail!.large!.url!),
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
                      controller.masterAlbum.value!.albumName!.default_,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // add padding to all children
                    children: [
                      IconButton.outlined(
                        onPressed: () {},
                        icon: const Icon(Icons.library_add_outlined),
                      ),
                      IconButton.filled(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow),
                        iconSize: 42,
                      ),
                      IconButton.outlined(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                  ...buildTrackViews(),
                  // ListView.builder(
                  //   padding: const EdgeInsets.only(top: 8),
                  //   itemBuilder: (context, index) {
                  //     return TrackTile(
                  //         trackData:
                  //             controller.masterAlbum.value!.tracks![index],
                  //         albumData: controller.masterAlbum.value!);
                  //   },
                  //   itemCount: controller.masterAlbum.value!.tracks!.length,
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  // ),
                ],
              ),
            ),
    );
  }
}

// class MobileAlbumPage extends StatefulWidget {
//   const MobileAlbumPage({super.key});

//   @override
//   State<MobileAlbumPage> createState() => _MobileAlbumPageState();
// }

// class _MobileAlbumPageState extends State<MobileAlbumPage> {
//   late AlbumReadDto _albumData;
//   late Future<AlbumReadDto?> _albumFuture;

//   @override
//   void initState() {
//     super.initState();
//     var albumId = Get.parameters['albumId'];

//     if (albumId == null) throw Exception('Album ID is null');

//     var albumApi = AlbumApi(Get.find<ApiClient>());

//     _albumFuture = albumApi.getAlbum(albumId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _albumFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text('Error: ${snapshot.error}'),
//           );
//         } else {
//           _albumData = snapshot.data as AlbumReadDto;
//           // sort the tracks
//           _albumData.tracks!.sort((a, b) => a.index!.compareTo(b.index!));

//           // update appbar
//           WidgetsBinding.instance!.addPostFrameCallback(
//             (_) {
//               Get.find<AppBarController>().updateFlexibleSpace(
//                 FlexibleSpaceBar(
//                   titlePadding: const EdgeInsets.only(left: 0.0),
//                   expandedTitleScale: 1,
//                   title: GestureDetector(
//                     onTap: () {
//                       print("Tapped");
//                     },
//                     child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         text: _albumData.albumArtist![0].name!,
//                         style: Theme.of(context).textTheme.bodyMedium,
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: '\nAlbum',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodySmall!
//                                 .copyWith(color: Colors.grey.shade600),
//                           ),
//                           TextSpan(
//                             text: ' · ',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodySmall!
//                                 .copyWith(color: Colors.grey.shade600),
//                           ),
//                           TextSpan(
//                             text: '${_albumData.releaseDate!.year}',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodySmall!
//                                 .copyWith(color: Colors.grey.shade600),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   centerTitle: true,
//                 ),
//               );
//             },
//           );
//         }

//         return Padding(
//           padding: const EdgeInsets.only(top: 8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               // Display album image
//               Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(_albumData.thumbnail!.large!.url!),
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Display album title
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 36.0),
//                 child: Text(
//                   _albumData.albumName!.default_,
//                   style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 // add padding to all children
//                 children: [
//                   IconButton.outlined(
//                     onPressed: () {},
//                     icon: const Icon(Icons.library_add_outlined),
//                   ),
//                   IconButton.filled(
//                     onPressed: () {},
//                     icon: const Icon(Icons.play_arrow),
//                     iconSize: 42,
//                   ),
//                   IconButton.outlined(
//                     onPressed: () {},
//                     icon: const Icon(Icons.more_vert),
//                   ),
//                 ],
//               ),
//               ListView.builder(
//                 padding: const EdgeInsets.only(top: 8),
//                 itemBuilder: (context, index) {
//                   return TrackTile(
//                       trackData: _albumData.tracks![index],
//                       albumData: _albumData);
//                 },
//                 itemCount: _albumData.tracks!.length,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 16.0),
//                 child: Center(
//                   child: Text(
//                       "${_albumData.tracks!.length} tracks · ${Util.sumTimeStr(Util.getTrackDurationList(_albumData.tracks!))}"),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
