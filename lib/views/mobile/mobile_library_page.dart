import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tlmc_player_flutter/components/playlist_tile.dart';
import 'package:tlmc_player_flutter/services/user_playlist_info_provider.dart';

class MobileLibraryPage extends StatelessWidget {
  const MobileLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var userPlaylistInfo = Get.find<UserPlaylistInfoProvider>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Library"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.history),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle_outlined),
              ),
            ],
            pinned: true,
            // floating: true,
            primary: true,
          ),
          Obx(
            () {
              if (userPlaylistInfo.status.value ==
                  PlaylistInfoProviderState.loading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return SliverList.builder(
                itemBuilder: (context, index) {
                  return PlaylistTile(
                      playlistInfo: userPlaylistInfo.playlistsInfo[index]);
                },
                itemCount: userPlaylistInfo.playlistsInfo.length,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Create Playlist"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
