//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class HlsAssetApi {
  HlsAssetApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/asset/track/{trackId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] trackId (required):
  Future<Response> apiAssetTrackTrackIdGetWithHttpInfo(String trackId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/asset/track/{trackId}'
      .replaceAll('{trackId}', trackId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] trackId (required):
  Future<void> apiAssetTrackTrackIdGet(String trackId,) async {
    final response = await apiAssetTrackTrackIdGetWithHttpInfo(trackId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/asset/track/{trackId}/hls/{quality}k/{segment}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] trackId (required):
  ///
  /// * [int] quality (required):
  ///
  /// * [String] segment (required):
  Future<Response> apiAssetTrackTrackIdHlsQualitykSegmentGetWithHttpInfo(String trackId, int quality, String segment,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/asset/track/{trackId}/hls/{quality}k/{segment}'
      .replaceAll('{trackId}', trackId)
      .replaceAll('{quality}', quality.toString())
      .replaceAll('{segment}', segment);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] trackId (required):
  ///
  /// * [int] quality (required):
  ///
  /// * [String] segment (required):
  Future<void> apiAssetTrackTrackIdHlsQualitykSegmentGet(String trackId, int quality, String segment,) async {
    final response = await apiAssetTrackTrackIdHlsQualitykSegmentGetWithHttpInfo(trackId, quality, segment,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/asset/track/{trackId}/hls/{quality}k/playlist.m3u8' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] trackId (required):
  ///
  /// * [int] quality (required):
  Future<Response> getMediaPlaylistWithHttpInfo(String trackId, int quality,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/asset/track/{trackId}/hls/{quality}k/playlist.m3u8'
      .replaceAll('{trackId}', trackId)
      .replaceAll('{quality}', quality.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] trackId (required):
  ///
  /// * [int] quality (required):
  Future<void> getMediaPlaylist(String trackId, int quality,) async {
    final response = await getMediaPlaylistWithHttpInfo(trackId, quality,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
