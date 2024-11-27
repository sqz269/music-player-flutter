import 'package:backend_client_api/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';

class ArtistInfoViewStates {
  final CircleReadDto circle;
  ArtistInfoViewStates({required this.circle});
}

class ArtistInfoViewController extends GetxController
    with StateMixin<ArtistInfoViewStates> {
  final String circleId;
  ArtistInfoViewController({required this.circleId});

  @override
  void onInit() {
    super.onInit();
    fetchCircle();
  }

  Future<void> fetchCircle() async {
    var circleApi = CircleApi(Get.find<ApiClientProvider>().getApiClient());
    var circle = await circleApi.getCircleById(circleId);
    if (circle == null) {
      change(null, status: RxStatus.error('Circle not found'));
    } else {
      change(ArtistInfoViewStates(circle: circle), status: RxStatus.success());
    }
  }
}
