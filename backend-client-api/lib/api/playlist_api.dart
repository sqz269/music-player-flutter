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

  /// Performs an HTTP 'POST /api/playlists' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PlaylistInfo] playlistInfo:
  Future<Response> addPlaylistWithHttpInfo({ PlaylistInfo? playlistInfo, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlists';

    // ignore: prefer_final_locals
    Object? postBody = playlistInfo;

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
  /// * [PlaylistInfo] playlistInfo:
  Future<PlaylistReadDto?> addPlaylist({ PlaylistInfo? playlistInfo, }) async {
    final response = await addPlaylistWithHttpInfo( playlistInfo: playlistInfo, );
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

  /// Performs an HTTP 'GET /api/playlists/user/{userId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] userId (required):
  Future<Response> apiPlaylistsUserUserIdGetWithHttpInfo(String userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlists/user/{userId}'
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
  Future<List<PlaylistReadDto>?> apiPlaylistsUserUserIdGet(String userId,) async {
    final response = await apiPlaylistsUserUserIdGetWithHttpInfo(userId,);
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

  /// Performs an HTTP 'DELETE /api/playlists/{playlistId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] playlistId (required):
  Future<Response> deletePlaylistWithHttpInfo(String playlistId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlists/{playlistId}'
      .replaceAll('{playlistId}', playlistId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
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
  Future<void> deletePlaylist(String playlistId,) async {
    final response = await deletePlaylistWithHttpInfo(playlistId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/playlists/me/favorite' operation and returns the [Response].
  Future<Response> getCurrentUserFavoriteWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlists/me/favorite';

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

  Future<PlaylistReadDto?> getCurrentUserFavorite() async {
    final response = await getCurrentUserFavoriteWithHttpInfo();
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

  /// Performs an HTTP 'GET /api/playlists/me/history' operation and returns the [Response].
  Future<Response> getCurrentUserHistoryWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlists/me/history';

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

  Future<PlaylistReadDto?> getCurrentUserHistory() async {
    final response = await getCurrentUserHistoryWithHttpInfo();
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

  /// Performs an HTTP 'GET /api/playlists/me' operation and returns the [Response].
  Future<Response> getCurrentUserPlaylistsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlists/me';

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

  Future<List<PlaylistReadDto>?> getCurrentUserPlaylists() async {
    final response = await getCurrentUserPlaylistsWithHttpInfo();
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

  /// Performs an HTTP 'GET /api/playlists/me/queue' operation and returns the [Response].
  Future<Response> getCurrentUserQueueWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlists/me/queue';

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

  Future<PlaylistReadDto?> getCurrentUserQueue() async {
    final response = await getCurrentUserQueueWithHttpInfo();
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

  /// Performs an HTTP 'GET /api/playlists/{playlistId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] playlistId (required):
  Future<Response> getPlaylistByIdWithHttpInfo(String playlistId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlists/{playlistId}'
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
  Future<PlaylistReadDto?> getPlaylistById(String playlistId,) async {
    final response = await getPlaylistByIdWithHttpInfo(playlistId,);
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

  /// Performs an HTTP 'PUT /api/playlists/{playlistId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] playlistId (required):
  ///
  /// * [PlaylistInfo] playlistInfo:
  Future<Response> updatePlaylistInfoWithHttpInfo(String playlistId, { PlaylistInfo? playlistInfo, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlists/{playlistId}'
      .replaceAll('{playlistId}', playlistId);

    // ignore: prefer_final_locals
    Object? postBody = playlistInfo;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
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
  ///
  /// * [PlaylistInfo] playlistInfo:
  Future<PlaylistReadDto?> updatePlaylistInfo(String playlistId, { PlaylistInfo? playlistInfo, }) async {
    final response = await updatePlaylistInfoWithHttpInfo(playlistId,  playlistInfo: playlistInfo, );
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
}
