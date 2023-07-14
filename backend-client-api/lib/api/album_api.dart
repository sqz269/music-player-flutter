//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class AlbumApi {
  AlbumApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/music/album' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [AlbumWriteDto] albumWriteDto:
  Future<Response> addAlbumWithHttpInfo({ AlbumWriteDto? albumWriteDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/music/album';

    // ignore: prefer_final_locals
    Object? postBody = albumWriteDto;

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
  /// * [AlbumWriteDto] albumWriteDto:
  Future<AlbumReadDtoActionResult?> addAlbum({ AlbumWriteDto? albumWriteDto, }) async {
    final response = await addAlbumWithHttpInfo( albumWriteDto: albumWriteDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AlbumReadDtoActionResult',) as AlbumReadDtoActionResult;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/music/album/{albumId}/track' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] albumId (required):
  ///
  /// * [TrackWriteDto] trackWriteDto:
  Future<Response> addTrackWithHttpInfo(String albumId, { TrackWriteDto? trackWriteDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/music/album/{albumId}/track'
      .replaceAll('{albumId}', albumId);

    // ignore: prefer_final_locals
    Object? postBody = trackWriteDto;

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
  /// * [TrackWriteDto] trackWriteDto:
  Future<TrackReadDtoActionResult?> addTrack(String albumId, { TrackWriteDto? trackWriteDto, }) async {
    final response = await addTrackWithHttpInfo(albumId,  trackWriteDto: trackWriteDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TrackReadDtoActionResult',) as TrackReadDtoActionResult;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/music/album/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> getAlbumWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/music/album/{id}'
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
  Future<AlbumReadDto?> getAlbum(String id,) async {
    final response = await getAlbumWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AlbumReadDto',) as AlbumReadDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/music/album/filter' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] title:
  ///
  /// * [DateTime] releaseDateBegin:
  ///
  /// * [DateTime] releaseDateEnd:
  ///
  /// * [String] convention:
  ///
  /// * [String] catalog:
  ///
  /// * [String] artist:
  ///
  /// * [String] artistId:
  ///
  /// * [int] start:
  ///
  /// * [int] limit:
  Future<Response> getAlbumFilteredWithHttpInfo({ String? title, DateTime? releaseDateBegin, DateTime? releaseDateEnd, String? convention, String? catalog, String? artist, String? artistId, int? start, int? limit, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/music/album/filter';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (title != null) {
      queryParams.addAll(_queryParams('', 'Title', title));
    }
    if (releaseDateBegin != null) {
      queryParams.addAll(_queryParams('', 'ReleaseDateBegin', releaseDateBegin));
    }
    if (releaseDateEnd != null) {
      queryParams.addAll(_queryParams('', 'ReleaseDateEnd', releaseDateEnd));
    }
    if (convention != null) {
      queryParams.addAll(_queryParams('', 'Convention', convention));
    }
    if (catalog != null) {
      queryParams.addAll(_queryParams('', 'Catalog', catalog));
    }
    if (artist != null) {
      queryParams.addAll(_queryParams('', 'Artist', artist));
    }
    if (artistId != null) {
      queryParams.addAll(_queryParams('', 'ArtistId', artistId));
    }
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
  /// * [String] title:
  ///
  /// * [DateTime] releaseDateBegin:
  ///
  /// * [DateTime] releaseDateEnd:
  ///
  /// * [String] convention:
  ///
  /// * [String] catalog:
  ///
  /// * [String] artist:
  ///
  /// * [String] artistId:
  ///
  /// * [int] start:
  ///
  /// * [int] limit:
  Future<List<AlbumReadDto>?> getAlbumFiltered({ String? title, DateTime? releaseDateBegin, DateTime? releaseDateEnd, String? convention, String? catalog, String? artist, String? artistId, int? start, int? limit, }) async {
    final response = await getAlbumFilteredWithHttpInfo( title: title, releaseDateBegin: releaseDateBegin, releaseDateEnd: releaseDateEnd, convention: convention, catalog: catalog, artist: artist, artistId: artistId, start: start, limit: limit, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<AlbumReadDto>') as List)
        .cast<AlbumReadDto>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/music/album' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] start:
  ///
  /// * [int] limit:
  Future<Response> getAlbumsWithHttpInfo({ int? start, int? limit, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/music/album';

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
  Future<List<AlbumReadDto>?> getAlbums({ int? start, int? limit, }) async {
    final response = await getAlbumsWithHttpInfo( start: start, limit: limit, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<AlbumReadDto>') as List)
        .cast<AlbumReadDto>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/music/random' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] limit:
  Future<Response> getRandomSampleTrackWithHttpInfo({ int? limit, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/music/random';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] limit:
  Future<TrackReadDtoActionResult?> getRandomSampleTrack({ int? limit, }) async {
    final response = await getRandomSampleTrackWithHttpInfo( limit: limit, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TrackReadDtoActionResult',) as TrackReadDtoActionResult;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/music/track/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> getTrackWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/music/track/{id}'
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
  Future<TrackReadDto?> getTrack(String id,) async {
    final response = await getTrackWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TrackReadDto',) as TrackReadDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/music/track' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [List<String>] requestBody:
  Future<Response> getTracksWithHttpInfo({ List<String>? requestBody, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/music/track';

    // ignore: prefer_final_locals
    Object? postBody = requestBody;

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
  /// * [List<String>] requestBody:
  Future<TrackGetMultipleResp?> getTracks({ List<String>? requestBody, }) async {
    final response = await getTracksWithHttpInfo( requestBody: requestBody, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TrackGetMultipleResp',) as TrackGetMultipleResp;
    
    }
    return null;
  }
}
