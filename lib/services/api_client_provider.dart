import 'package:get/get.dart';
import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_flutter/services/backend_client_authentication_provider.dart';

class ApiClientProvider {
  final BackendClientAuthenticationProvider authProvider;
  final String basePath;

  ApiClientProvider({required this.basePath})
      : authProvider = Get.find<BackendClientAuthenticationProvider>() {
    // Do nothing
  }

  ApiClient getApiClient() {
    if (authProvider.readyAndAuthenticated.value) {
      return ApiClient(
        basePath: "https://api-music.marisad.me",
        authentication: authProvider,
      );
    }

    return ApiClient(basePath: "https://api-music.marisad.me");
  }
}
