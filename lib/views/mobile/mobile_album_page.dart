import 'package:flutter/material.dart';

import 'package:BackendClientApi/api.dart';

import 'package:get/get.dart';

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

  static timeStrNoHours(String timeString) {
    // remove the hours if it is 00
    if (timeString.startsWith("00:")) {
      return timeString.substring(3);
    } else {
      return timeString;
    }
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
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("data"),
              ],
            ),
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
                style: TextStyle(fontSize: 24),
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
                  iconSize: 36,
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
                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _albumData.tracks![index].index.toString(),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  title: Text(
                    _albumData.tracks![index].name!.default_,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  subtitle: Text(
                      timeStrNoHours(_albumData.tracks![index].duration!),
                      style: Theme.of(context).textTheme.labelMedium),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                );
              },
              itemCount: _albumData.tracks!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            )
          ],
        );
      },
    );
  }
}
