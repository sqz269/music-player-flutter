import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/authentication_service.dart';

class ApiClientProvider extends Authentication {
  final OidcAuthenticationService _authService;

  ApiClientProvider() : _authService = Get.find<OidcAuthenticationService>();

  ApiClient getApiClient() {
    if (_authService.isAuthenticated.value) {
      return ApiClient(
          basePath: 'https://api-music.marisad.me', authentication: this);
    }

    return ApiClient(
      basePath: 'https://api-music.marisad.me',
    );
  }

  @override
  Future<void> applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams) async {
    if (_authService.isAuthenticated.value) {
      var token = await _authService.getToken();
      headerParams['Authorization'] = 'Bearer ${token.accessToken}';
    }
  }
}
