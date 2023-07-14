//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class PlaylistItemApi {
  PlaylistItemApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/playlistItem' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PlaylistItemAddRequest] playlistItemAddRequest:
  Future<Response> addPlaylistItemToPlaylistWithHttpInfo({ PlaylistItemAddRequest? playlistItemAddRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlistItem';

    // ignore: prefer_final_locals
    Object? postBody = playlistItemAddRequest;

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
  /// * [PlaylistItemAddRequest] playlistItemAddRequest:
  Future<PlaylistItemReadDto?> addPlaylistItemToPlaylist({ PlaylistItemAddRequest? playlistItemAddRequest, }) async {
    final response = await addPlaylistItemToPlaylistWithHttpInfo( playlistItemAddRequest: playlistItemAddRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PlaylistItemReadDto',) as PlaylistItemReadDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/playlistItem' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PlaylistItemDeleteRequest] playlistItemDeleteRequest:
  Future<Response> deletePlaylistItemFromPlaylistWithHttpInfo({ PlaylistItemDeleteRequest? playlistItemDeleteRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/playlistItem';

    // ignore: prefer_final_locals
    Object? postBody = playlistItemDeleteRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


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
  /// * [PlaylistItemDeleteRequest] playlistItemDeleteRequest:
  Future<void> deletePlaylistItemFromPlaylist({ PlaylistItemDeleteRequest? playlistItemDeleteRequest, }) async {
    final response = await deletePlaylistItemFromPlaylistWithHttpInfo( playlistItemDeleteRequest: playlistItemDeleteRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
