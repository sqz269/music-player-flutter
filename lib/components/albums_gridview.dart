import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/components/album_card.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AlbumsSliverGridView extends StatefulWidget {
  final Future<AlbumsListResult?> Function(int start, int limit,
      AlbumOrderOptions sortField, SortOrder sortDirection) fetchAlbums;

  final Future<int> Function()? fetchAlbumCount;

  AlbumsSliverGridView(
      {super.key, required this.fetchAlbums, this.fetchAlbumCount});

  @override
  State<AlbumsSliverGridView> createState() => _AlbumsSliverGridViewState();
}

class _AlbumsSliverGridViewState extends State<AlbumsSliverGridView> {
  var orderOptions = AlbumOrderOptions.id.obs;

  var sortOrder = SortOrder.ascending.obs;

  var currentPage = 0.obs;

  var pageSize = 50.obs;

  var totalAlbums = 0.obs;

  var isLoading = false.obs;

  var albumData = Rx<List<AlbumReadDto>?>(null);

  fetchAlbumData() async {
    print("Fetching albums");
    isLoading.value = true;
    var albums = await widget.fetchAlbums(currentPage.value * pageSize.value,
        pageSize.value, orderOptions.value, sortOrder.value);
    if (albums == null) {}
    albumData.value = albums!.albums;
    totalAlbums.value = albums.total!;
    isLoading.value = false;
  }

  nextPage() {
    gotoPage(++currentPage.value);
  }

  previousPage() {
    gotoPage(--currentPage.value);
  }

  gotoPage(int page) {
    currentPage.value = page;
    fetchAlbumData();
  }

  @override
  void initState() {
    super.initState();
    fetchAlbumData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (isLoading.value) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          double? calculatedHeight =
              0.54 * MediaQuery.of(context).size.width + 16;

          return MultiSliver(
            children: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Ordered By: "),
                          DropdownButton(
                            value: orderOptions.value,
                            items: const [
                              DropdownMenuItem(
                                child: Text("Id"),
                                value: AlbumOrderOptions.id,
                              ),
                              DropdownMenuItem(
                                child: Text("Name"),
                                value: AlbumOrderOptions.title,
                              ),
                              DropdownMenuItem(
                                child: Text("Date"),
                                value: AlbumOrderOptions.date,
                              ),
                            ],
                            onChanged: (value) {
                              orderOptions.value = value as AlbumOrderOptions;
                              fetchAlbumData();
                            },
                            isDense: true,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Sort Order: "),
                          DropdownButton(
                            value: sortOrder.value,
                            items: const [
                              DropdownMenuItem(
                                child: Text("Ascending"),
                                value: SortOrder.ascending,
                              ),
                              DropdownMenuItem(
                                child: Text("Descending"),
                                value: SortOrder.descending,
                              ),
                            ],
                            onChanged: (value) {
                              sortOrder.value = value as SortOrder;
                              fetchAlbumData();
                            },
                            isDense: true,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisExtent: calculatedHeight,
                  mainAxisSpacing: 10,
                ),
                itemCount: albumData.value?.length,
                itemBuilder: (context, index) {
                  return AlbumCard(albumData: albumData.value![index]);
                },
              ),
              SliverToBoxAdapter(
                child: NumberPaginator(
                  numberPages: (totalAlbums.value / pageSize.value).ceil(),
                  initialPage: currentPage.value,
                  onPageChange: gotoPage,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}