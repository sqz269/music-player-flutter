//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class CircleApi {
  CircleApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/entity/circle/{id}/albums' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [int] start:
  ///
  /// * [int] limit:
  ///
  /// * [AlbumOrderOptions] sort:
  ///
  /// * [SortOrder] sortOrder:
  Future<Response> getCircleAlbumsByIdWithHttpInfo(String id, { int? start, int? limit, AlbumOrderOptions? sort, SortOrder? sortOrder, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/entity/circle/{id}/albums'
      .replaceAll('{id}', id);

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
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (sortOrder != null) {
      queryParams.addAll(_queryParams('', 'sortOrder', sortOrder));
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
  /// * [String] id (required):
  ///
  /// * [int] start:
  ///
  /// * [int] limit:
  ///
  /// * [AlbumOrderOptions] sort:
  ///
  /// * [SortOrder] sortOrder:
  Future<AlbumsListResult?> getCircleAlbumsById(String id, { int? start, int? limit, AlbumOrderOptions? sort, SortOrder? sortOrder, }) async {
    final response = await getCircleAlbumsByIdWithHttpInfo(id,  start: start, limit: limit, sort: sort, sortOrder: sortOrder, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AlbumsListResult',) as AlbumsListResult;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/entity/circle/{name}/albums' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] name (required):
  ///
  /// * [int] start:
  ///
  /// * [int] limit:
  ///
  /// * [AlbumOrderOptions] sort:
  ///
  /// * [SortOrder] sortOrder:
  Future<Response> getCircleAlbumsByNameWithHttpInfo(String name, { int? start, int? limit, AlbumOrderOptions? sort, SortOrder? sortOrder, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/entity/circle/{name}/albums'
      .replaceAll('{name}', name);

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
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (sortOrder != null) {
      queryParams.addAll(_queryParams('', 'sortOrder', sortOrder));
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
  /// * [String] name (required):
  ///
  /// * [int] start:
  ///
  /// * [int] limit:
  ///
  /// * [AlbumOrderOptions] sort:
  ///
  /// * [SortOrder] sortOrder:
  Future<AlbumsListResult?> getCircleAlbumsByName(String name, { int? start, int? limit, AlbumOrderOptions? sort, SortOrder? sortOrder, }) async {
    final response = await getCircleAlbumsByNameWithHttpInfo(name,  start: start, limit: limit, sort: sort, sortOrder: sortOrder, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AlbumsListResult',) as AlbumsListResult;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/entity/circle/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> getCircleByIdWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/entity/circle/{id}'
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
  Future<CircleReadDto?> getCircleById(String id,) async {
    final response = await getCircleByIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CircleReadDto',) as CircleReadDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/entity/circle/{name}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] name (required):
  Future<Response> getCircleByNameWithHttpInfo(String name,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/entity/circle/{name}'
      .replaceAll('{name}', name);

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
  /// * [String] name (required):
  Future<CircleReadDto?> getCircleByName(String name,) async {
    final response = await getCircleByNameWithHttpInfo(name,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CircleReadDto',) as CircleReadDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/entity/circle' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] start:
  ///
  /// * [int] limit:
  Future<Response> getCirclesWithHttpInfo({ int? start, int? limit, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/entity/circle';

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
  Future<List<CircleReadDto>?> getCircles({ int? start, int? limit, }) async {
    final response = await getCirclesWithHttpInfo( start: start, limit: limit, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CircleReadDto>') as List)
        .cast<CircleReadDto>()
        .toList();

    }
    return null;
  }
}
