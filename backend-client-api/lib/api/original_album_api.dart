//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class OriginalAlbumApi {
  OriginalAlbumApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/source/album' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [OriginalAlbumWriteDto] originalAlbumWriteDto:
  Future<Response> addOriginalAlbumWithHttpInfo({ OriginalAlbumWriteDto? originalAlbumWriteDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/source/album';

    // ignore: prefer_final_locals
    Object? postBody = originalAlbumWriteDto;

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
  /// * [OriginalAlbumWriteDto] originalAlbumWriteDto:
  Future<OriginalAlbumReadDtoActionResult?> addOriginalAlbum({ OriginalAlbumWriteDto? originalAlbumWriteDto, }) async {
    final response = await addOriginalAlbumWithHttpInfo( originalAlbumWriteDto: originalAlbumWriteDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OriginalAlbumReadDtoActionResult',) as OriginalAlbumReadDtoActionResult;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/source/album/{albumId}/track' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] albumId (required):
  ///
  /// * [OriginalTrackWriteDto] originalTrackWriteDto:
  Future<Response> addOriginalTrackWithHttpInfo(String albumId, { OriginalTrackWriteDto? originalTrackWriteDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/source/album/{albumId}/track'
      .replaceAll('{albumId}', albumId);

    // ignore: prefer_final_locals
    Object? postBody = originalTrackWriteDto;

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
  /// * [String] albumId (required):
  ///
  /// * [OriginalTrackWriteDto] originalTrackWriteDto:
  Future<OriginalTrackReadDtoActionResult?> addOriginalTrack(String albumId, { OriginalTrackWriteDto? originalTrackWriteDto, }) async {
    final response = await addOriginalTrackWithHttpInfo(albumId,  originalTrackWriteDto: originalTrackWriteDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OriginalTrackReadDtoActionResult',) as OriginalTrackReadDtoActionResult;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/source/album/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> getOriginalAlbumWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/source/album/{id}'
      .replaceAll('{id}', id);

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
  /// * [String] id (required):
  Future<OriginalAlbumReadDto?> getOriginalAlbum(String id,) async {
    final response = await getOriginalAlbumWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OriginalAlbumReadDto',) as OriginalAlbumReadDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/source/album' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] start:
  ///
  /// * [int] limit:
  Future<Response> getOriginalAlbumsWithHttpInfo({ int? start, int? limit, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/source/album';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (start != null) {
      queryParams.addAll(_queryParams('', 'start', start));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }

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
  /// * [int] start:
  ///
  /// * [int] limit:
  Future<List<OriginalAlbumReadDto>?> getOriginalAlbums({ int? start, int? limit, }) async {
    final response = await getOriginalAlbumsWithHttpInfo( start: start, limit: limit, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<OriginalAlbumReadDto>') as List)
        .cast<OriginalAlbumReadDto>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/source/track/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> getOriginalTrackWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/source/track/{id}'
      .replaceAll('{id}', id);

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
  /// * [String] id (required):
  Future<OriginalTrackReadDto?> getOriginalTrack(String id,) async {
    final response = await getOriginalTrackWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OriginalTrackReadDto',) as OriginalTrackReadDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/source/track' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] start:
  ///
  /// * [int] limit:
  Future<Response> getOriginalTracksWithHttpInfo({ int? start, int? limit, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/source/track';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (start != null) {
      queryParams.addAll(_queryParams('', 'start', start));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }

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
  /// * [int] start:
  ///
  /// * [int] limit:
  Future<List<OriginalTrackReadDto>?> getOriginalTracks({ int? start, int? limit, }) async {
    final response = await getOriginalTracksWithHttpInfo( start: start, limit: limit, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<OriginalTrackReadDto>') as List)
        .cast<OriginalTrackReadDto>()
        .toList();

    }
    return null;
  }
}
