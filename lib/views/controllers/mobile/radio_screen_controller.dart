import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tlmc_player_app/models/radio_filters.dart';
import 'package:tlmc_player_app/services/impl/radio_service.dart';

class RadioScreenViewStates {
  final RadioFilters filters;

  RadioScreenViewStates({required this.filters});
}

class RadioScreenController extends GetxController
    with StateMixin<RadioScreenViewStates> {
  final RadioService _radioService;

  RadioScreenController() : _radioService = Get.find<RadioService>();

  @override
  void onInit() {
    super.onInit();
    change(RadioScreenViewStates(filters: _radioService.filters.value),
        status: RxStatus.success());
  }
}
