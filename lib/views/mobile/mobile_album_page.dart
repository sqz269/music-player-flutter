import 'package:flutter/material.dart';

import 'package:BackendClientApi/api.dart';

import 'package:get/get.dart';
import 'package:tlmc_player_flutter/components/track_tile.dart';
import 'package:tlmc_player_flutter/utils/utils.dart';

import '../../ui_state/appbar_controller.dart';

class MobileAlbumPage extends StatefulWidget {
  const MobileAlbumPage({super.key});

  @override
  State<MobileAlbumPage> createState() => _MobileAlbumPageState();
}

class _MobileAlbumPageState extends State<MobileAlbumPage> {
  late AlbumReadDto _albumData;
  late Future<AlbumReadDto?> _albumFuture;

  @override
  void initState() {
    super.initState();
    print("Init state");
    var albumId = Get.parameters['albumId'];

    print("Param: $albumId");
    if (albumId == null) throw Exception('Album ID is null');

    var albumApi = AlbumApi(Get.find<ApiClient>());

    _albumFuture = albumApi.getAlbum(albumId);
    print("Request sent");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _albumFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          _albumData = snapshot.data as AlbumReadDto;
          // sort the tracks
          _albumData.tracks!.sort((a, b) => a.index!.compareTo(b.index!));
          print("Data: ${_albumData.tracks!.length}");
          _albumData.tracks?.forEach((element) {
            print(element.name!.default_);
          });

          // update appbar
          WidgetsBinding.instance!.addPostFrameCallback(
            (_) {
              Get.find<AppBarController>().updateFlexibleSpace(
                FlexibleSpaceBar(
                  title: GestureDetector(
                    onTap: () {
                      print("Tapped");
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: _albumData.albumArtist![0].name!,
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nAlbum',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey.shade600),
                          ),
                          TextSpan(
                            text: ' · ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey.shade600),
                          ),
                          TextSpan(
                            text: '${_albumData.releaseDate!.year}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  centerTitle: true,
                ),
              );
            },
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Display album image
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(_albumData.thumbnail!.large!.url!),
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
                _albumData.albumName!.default_,
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
              // add padding to all children
              children: [
                IconButton.outlined(
                  onPressed: () {},
                  icon: Icon(Icons.library_add_outlined),
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow),
                  iconSize: 42,
                ),
                IconButton.outlined(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ],
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return TrackTile(
                    trackData: _albumData.tracks![index],
                    albumData: _albumData);
              },
              itemCount: _albumData.tracks!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: Text(
                    "${_albumData.tracks!.length} tracks · ${Util.sumTimeStr(Util.getTrackDurationList(_albumData.tracks!))}"),
              ),
            ),
          ],
        );
      },
    );
  }
}
