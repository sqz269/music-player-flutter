import 'package:flutter/material.dart';

import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';

import 'package:tlmc_player_flutter/components/album_card.dart';
import 'package:tlmc_player_flutter/ui_state/appbar_controller.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({
    super.key,
  });

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  late List<AlbumReadDto> _albumData;
  late Future<List<AlbumReadDto>?> _albumFuture;

  @override
  void initState() {
    super.initState();
    print("Init state");
    var albumApi = AlbumApi(Get.find<ApiClient>());
    this._albumFuture = albumApi.getAlbums(limit: 50);
    print("Request sent");
  }

  @override
  Widget build(BuildContext context) {
    double? calculatedHeight = 0.36 * MediaQuery.of(context).size.width - 4;

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
          _albumData = snapshot.data as List<AlbumReadDto>;
        }

        return Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisExtent: calculatedHeight,
                mainAxisSpacing: 10,
              ),
              itemCount: 50,
              itemBuilder: (context, index) {
                return AlbumCard(albumData: this._albumData[index]);
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        );
      },
    );
  }
}
