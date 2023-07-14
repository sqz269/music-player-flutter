//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class PlaylistApi {
  PlaylistApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/playlist' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PlaylistCreateRequest] playlistCreateRequest:
  Future<Response> apiPlaylistPostWithHttpInfo({ PlaylistCreateRequest? playlistCreateRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlist';

    // ignore: prefer_final_locals
    Object? postBody = playlistCreateRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [PlaylistCreateRequest] playlistCreateRequest:
  Future<PlaylistReadDto?> apiPlaylistPost({ PlaylistCreateRequest? playlistCreateRequest, }) async {
    final response = await apiPlaylistPostWithHttpInfo( playlistCreateRequest: playlistCreateRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PlaylistReadDto',) as PlaylistReadDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/playlist/user/me/favorite' operation and returns the [Response].
  Future<Response> getCurrentUserFavoriteWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlist/user/me/favorite';

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

  Future<List<PlaylistReadDto>?> getCurrentUserFavorite() async {
    final response = await getCurrentUserFavoriteWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<PlaylistReadDto>') as List)
        .cast<PlaylistReadDto>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/playlist/user/me/history' operation and returns the [Response].
  Future<Response> getCurrentUserHistoryWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlist/user/me/history';

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

  Future<List<PlaylistReadDto>?> getCurrentUserHistory() async {
    final response = await getCurrentUserHistoryWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<PlaylistReadDto>') as List)
        .cast<PlaylistReadDto>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/playlist/user/me' operation and returns the [Response].
  Future<Response> getCurrentUserPlaylistWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlist/user/me';

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

  Future<List<PlaylistReadDto>?> getCurrentUserPlaylist() async {
    final response = await getCurrentUserPlaylistWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<PlaylistReadDto>') as List)
        .cast<PlaylistReadDto>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/playlist/user/me/queue' operation and returns the [Response].
  Future<Response> getCurrentUserQueueWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlist/user/me/queue';

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

  Future<List<PlaylistReadDto>?> getCurrentUserQueue() async {
    final response = await getCurrentUserQueueWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<PlaylistReadDto>') as List)
        .cast<PlaylistReadDto>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/playlist/{playlistId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] playlistId (required):
  Future<Response> getPlaylistWithHttpInfo(String playlistId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlist/{playlistId}'
      .replaceAll('{playlistId}', playlistId);

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
  /// * [String] playlistId (required):
  Future<PlaylistReadDto?> getPlaylist(String playlistId,) async {
    final response = await getPlaylistWithHttpInfo(playlistId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PlaylistReadDto',) as PlaylistReadDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/playlist/user/{userId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] userId (required):
  Future<Response> getUserPlaylistWithHttpInfo(String userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlist/user/{userId}'
      .replaceAll('{userId}', userId);

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
  /// * [String] userId (required):
  Future<List<PlaylistReadDto>?> getUserPlaylist(String userId,) async {
    final response = await getUserPlaylistWithHttpInfo(userId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<PlaylistReadDto>') as List)
        .cast<PlaylistReadDto>()
        .toList();

    }
    return null;
  }
}
