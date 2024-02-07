import 'package:BackendClientApi/api.dart';

class ApiClientProvider {
  ApiClient getApiClient() {
    return ApiClient(
      basePath: 'https://api-music.marisad.me',
    );
  }
}
