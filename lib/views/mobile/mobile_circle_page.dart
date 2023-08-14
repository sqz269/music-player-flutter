import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/components/albums_gridview.dart';

class CirclePageController extends GetxController {
  final String circleId;

  CirclePageController({required this.circleId});

  @override
  void onInit() {
    super.onInit();

    var circleController = CircleApi(Get.find<ApiClient>());
    circleController.getCircleAlbumsById(circleId);
  }
}

class MobileCirclePage extends StatefulWidget {
  final Map<String, String?> routeParams;
  final String circleId;
  MobileCirclePage({super.key, required this.routeParams})
      : circleId = routeParams['circleId'] ?? '';

  @override
  State<MobileCirclePage> createState() => _MobileCirclePageState();
}

class _MobileCirclePageState extends State<MobileCirclePage> {
  var isLoading = true.obs;
  Rx<CircleReadDto?> circleData = Rx<CircleReadDto?>(null);

  @override
  void initState() {
    super.initState();
    initCircleData();
  }

  Future initCircleData() async {
    var circleApi = CircleApi(Get.find<ApiClient>());
    isLoading.value = true;
    circleData.value = await circleApi.getCircleById(widget.circleId);
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    var circleApi = CircleApi(Get.find<ApiClient>());

    return Obx(() {
      if (isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('${circleData.value?.name}'),
                pinned: true,
                floating: true,
                snap: true,
                primary: true,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                sliver: AlbumsSliverGridView(
                  fetchAlbums: (p0, p1, sortField, sortDirection) =>
                      circleApi.getCircleAlbumsById(widget.circleId,
                          start: p0,
                          limit: p1,
                          sort: sortField,
                          sortOrder: sortDirection),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
