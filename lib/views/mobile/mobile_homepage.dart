import 'package:flutter/material.dart';

import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';

import 'package:tlmc_player_flutter/components/album_card.dart';
import 'package:tlmc_player_flutter/components/albums_gridview.dart';

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

  late int _currentPage;

  @override
  void initState() {
    super.initState();
    print("Init state");
    goToPage(0);
    print("Request sent");
  }

  void nextPage() {
    setState(() {
      goToPage(_currentPage++);
    });
  }

  void previousPage() {
    setState(() {
      if (_currentPage == 0) return;
      goToPage(_currentPage--);
    });
  }

  void goToPage(int page) {
    setState(() {
      _currentPage = page;
      var albumApi = AlbumApi(Get.find<ApiClient>());
      _albumFuture = albumApi.getAlbums(
          limit: 50,
          start: (_currentPage) * 50,
          sort: AlbumOrderOptions.date,
          sortOrder: SortOrder.ascending);
    });
  }

  @override
  Widget build(BuildContext context) {
    var albumApi = AlbumApi(Get.find<ApiClient>());

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

        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  leading: Icon(Icons.menu),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.account_circle_outlined),
                    ),
                  ],
                  pinned: false,
                  primary: true,
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: AlbumsSliverGridView(
                      fetchAlbums: (p0, p1, sortField, sortDirection) =>
                          albumApi.getAlbums(
                              start: p0,
                              limit: p1,
                              sort: sortField,
                              sortOrder: sortDirection)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
