import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/components/album_card.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AlbumsSliverGridView extends StatefulWidget {
  final Future<AlbumsListResult?> Function(int start, int limit,
      AlbumOrderOptions sortField, SortOrder sortDirection) fetchAlbums;

  final Future<int> Function()? fetchAlbumCount;

  const AlbumsSliverGridView(
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

  var isError = false.obs;

  var fetchException = Rx<Object?>(null);

  var albumData = Rx<List<AlbumReadDto>?>(null);

  fetchAlbumData() async {
    print("Fetching albums");
    isLoading.value = true;
    isError.value = false;
    fetchException.value = null;

    var albums = await widget
        .fetchAlbums(currentPage.value * pageSize.value, pageSize.value,
            orderOptions.value, sortOrder.value)
        .onError((error, stackTrace) {
      print("Error fetching albums: $error");
      isLoading.value = false;
      isError.value = true;
      fetchException.value = error;
      print(stackTrace);
      return null;
    });
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
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (isError.value) {
          if (fetchException.value is ApiException) {
            var apiException = fetchException.value as ApiException;
            return SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Error fetching albums: ${apiException.code}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.red)),
                    Text(apiException.message!, softWrap: true),
                    IconButton(
                      onPressed: () {
                        isError.value = false;
                        fetchAlbumData();
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              ),
            );
          }
          return SliverToBoxAdapter(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Error fetching albums"),
                  IconButton(
                    onPressed: () {
                      isError.value = false;
                      fetchAlbumData();
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
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
                          const Text("Ordered By: "),
                          DropdownButton(
                            value: orderOptions.value,
                            items: const [
                              DropdownMenuItem(
                                value: AlbumOrderOptions.id,
                                child: Text("Id"),
                              ),
                              DropdownMenuItem(
                                value: AlbumOrderOptions.title,
                                child: Text("Name"),
                              ),
                              DropdownMenuItem(
                                value: AlbumOrderOptions.date,
                                child: Text("Date"),
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
                          const Text("Sort Order: "),
                          DropdownButton(
                            value: sortOrder.value,
                            items: const [
                              DropdownMenuItem(
                                value: SortOrder.ascending,
                                child: Text("Ascending"),
                              ),
                              DropdownMenuItem(
                                value: SortOrder.descending,
                                child: Text("Descending"),
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
                  return RepaintBoundary(
                      child: AlbumCard(albumData: albumData.value![index]));
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
