import 'package:backend_client_api/api.dart';
import 'package:get/get.dart';

class SliverAlbumGridViewStates {
  final int currentPage;
  final int totalPages;
  final List<AlbumReadDto> albums;

  SliverAlbumGridViewStates({
    required this.currentPage,
    required this.totalPages,
    required this.albums,
  });
}

class SliverAlbumGridViewController extends GetxController
    with StateMixin<SliverAlbumGridViewStates> {
  final Future<AlbumsListResult?> Function(int start, int limit,
      AlbumOrderOptions sortField, SortOrder sortDirection) fetchAlbums;

  var orderOptions = AlbumOrderOptions.id.obs;
  var sortOrder = SortOrder.ascending.obs;
  var pageSize = 50.obs;

  SliverAlbumGridViewController({required this.fetchAlbums});

  @override
  void onInit() {
    super.onInit();

    orderOptions.listen((_) => reloadPage());
    sortOrder.listen((_) => reloadPage());
    pageSize.listen((_) => reloadPage());

    changePage(0);
  }

  Future<void> changePage(int pageNumber) async {
    change(null, status: RxStatus.loading());

    try {
      final result = await fetchAlbums(
        pageNumber * pageSize.value,
        pageSize.value,
        orderOptions.value,
        sortOrder.value,
      );

      if (result == null) {
        change(null, status: RxStatus.error('Failed to fetch albums'));
      } else {
        change(
          SliverAlbumGridViewStates(
            currentPage: pageNumber,
            totalPages: (result.total! / pageSize.value).ceil(),
            albums: result.albums!,
          ),
          status: RxStatus.success(),
        );
      }
    } catch (e) {
      change(null, status: RxStatus.error('Failed to fetch albums'));
    }
  }

  Future<void> reloadPage() async {
    if (state != null) {
      await changePage(state!.currentPage);
    } else {
      changePage(0);
    }
    return;
  }

  void changeSortOrder(SortOrder order) {
    sortOrder.value = order;
  }

  void changeSortField(AlbumOrderOptions field) {
    orderOptions.value = field;
  }

  void changePageSize(int size) {
    pageSize.value = size;
  }
}
