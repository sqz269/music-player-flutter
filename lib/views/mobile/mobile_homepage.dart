import 'package:flutter/material.dart';

import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';

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

  late int _currentPage;

  @override
  void initState() {
    super.initState();
    print("Init state");
    goToPage(8);
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
      _albumFuture = albumApi.getAlbums(limit: 50, start: (_currentPage) * 50);
    });
  }

  @override
  Widget build(BuildContext context) {
    double? calculatedHeight = 0.54 * MediaQuery.of(context).size.width - 4;

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
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(8.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
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
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: NumberPaginator(
                    numberPages: 278,
                    initialPage: _currentPage,
                    onPageChange: goToPage,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
