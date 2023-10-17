import 'package:flutter/material.dart';

import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';

import 'package:tlmc_player_flutter/components/album_card.dart';
import 'package:tlmc_player_flutter/components/albums_gridview.dart';
import 'package:tlmc_player_flutter/components/dialog_user_account.dart';
import 'package:tlmc_player_flutter/services/api_client_provider.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var albumApi = AlbumApi(Get.find<ApiClientProvider>().getApiClient());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.menu),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/search", arguments: {});
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (_) => DialogUserAccount());
                },
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
