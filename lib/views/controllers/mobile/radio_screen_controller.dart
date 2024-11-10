import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tlmc_player_app/models/radio_filters.dart';
import 'package:tlmc_player_app/services/impl/radio_service.dart';
import 'package:tlmc_player_app/services/impl/static_data_provider.dart';

class RadioScreenViewStates {
  final RadioFilters filters;

  RadioScreenViewStates({required this.filters});
}

class RadioScreenController extends GetxController
    with StateMixin<RadioScreenViewStates> {
  final _radioService = Get.find<RadioService>();
  final _staticDataProvider = Get.find<StaticDataProvider>();

  var keyboardHeight = 0.0.obs;
  var inputHeight = 0.0.obs;
  var isKeyboardVisible = false.obs;

  // Stored value for inputs
  var startRange = Rxn<DateTime>();
  var endRange = Rxn<DateTime>();
  var circles = Rxn<List<CircleReadDto>>();
  var originalAlbums = Rxn<List<OriginalAlbumReadDto>>();
  var originalTracks = Rxn<List<OriginalTrackReadDto>>();

  // Controller for the date input
  final startRangeController = TextEditingController();
  final endRangeController = TextEditingController();

  // Keys for widget inputs
  final startRangeKey = GlobalKey();
  final endRangeKey = GlobalKey();
  final originalAlbumsKey = GlobalKey();
  final originalTracksKey = GlobalKey();
  final circlesKey = GlobalKey();

  RadioScreenController();

  @override
  void onInit() {
    super.onInit();
    change(RadioScreenViewStates(filters: _radioService.filters.value),
        status: RxStatus.success());
  }

  void applyFilters() {
    _radioService.filters.value = RadioFilters(
      releaseDateBegin: startRange.value,
      releaseDateEnd: endRange.value,
      circles: circles.value,
      originalAlbums: originalAlbums.value,
      originalTracks: originalTracks.value,
    );
  }

  void clearFilters() {
    _radioService.filters.value = RadioFilters.empty();
    startRange.value = null;
    endRange.value = null;
    circles.value = null;
    originalAlbums.value = null;
    originalTracks.value = null;
  }
}
