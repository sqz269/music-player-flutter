import 'package:flutter/material.dart';

import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';

import 'package:tlmc_player_flutter/components/album_card.dart';
import 'package:tlmc_player_flutter/components/albums_gridview.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var albumApi = AlbumApi(Get.find<ApiClient>());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            pinned: true,
            // floating: true,
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
    );
  }
}
