import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/models/application_pages.dart';
import 'package:tlmc_player_app/services/api/i_playlist_service.dart';
import 'package:tlmc_player_app/views/desktop/widgets/playlist_icon_tile_desktop.dart';

class SideNavigationRail extends StatelessWidget {
  final ApplicationPages _currentPage;
  final Function(ApplicationPages) _onPageSelected;

  SideNavigationRail({
    super.key,
    required ApplicationPages currentPage,
    required Function(ApplicationPages) onPageSelected,
  })  : _currentPage = currentPage,
        _onPageSelected = onPageSelected;

  List<NavigationRailDestination> _buildNavigationDestinations(
      BuildContext context) {
    return [
      const NavigationRailDestination(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: Text('Home'),
      ),
      const NavigationRailDestination(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        icon: Icon(Icons.explore_outlined),
        selectedIcon: Icon(Icons.explore),
        label: Text('Explore'),
      ),
      const NavigationRailDestination(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        icon: Icon(Icons.library_music_outlined),
        selectedIcon: Icon(Icons.library_music),
        label: Text('Library'),
      ),
    ];
  }

  Widget _buildPlaylistItems(BuildContext context) {
    var playlistService = Get.find<IPlaylistService>();

    if (!playlistService.isReady.value) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var playlist = playlistService.playlists.value[index];
        return PlaylistIconTileDesktop(
          playlistName: playlist.name!,
          playlistId: playlist.id!,
        );
      },
      itemCount: playlistService.playlists.length,
    );
  }

  Widget _buildSpecialPlaylistItems(BuildContext context) {
    return const Column(
      children: [
        Divider(
          height: 16,
          thickness: 2,
        ),
        PlaylistIconTileDesktop(
          playlistName: "Favorites",
          playlistId: "favorites",
          icon: Icon(
            Icons.favorite,
          ),
        ),
        SizedBox(height: 16),
        PlaylistIconTileDesktop(
          playlistName: "History",
          playlistId: "history",
          icon: Icon(
            Icons.history,
          ),
        ),
        Divider(
          height: 16,
          thickness: 2,
        ),
      ],
    );
  }

  Widget _buildPlaylistView(BuildContext context) {
    var playlistService = Get.find<IPlaylistService>();

    return Obx(
      () {
        if (!playlistService.isReady.value) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          width: 200,
          child: Column(
            children: [
              _buildSpecialPlaylistItems(context),
              _buildPlaylistItems(context),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      elevation: 6,
      extended: true,
      trailing: _buildPlaylistView(context),
      destinations: _buildNavigationDestinations(context),
      selectedIndex: _currentPage.index,
      onDestinationSelected: (index) =>
          _onPageSelected(ApplicationPages.values[index]),
    );
  }
}
