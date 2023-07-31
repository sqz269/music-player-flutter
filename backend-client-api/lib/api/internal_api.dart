//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of Backend.ClientApi;


class InternalApi {
  InternalApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'PUT /api/internal/album/add/{albumId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] albumId (required):
  ///
  /// * [String] parentId:
  ///
  /// * [AlbumWriteDto] albumWriteDto:
  Future<Response> apiInternalAlbumAddAlbumIdPutWithHttpInfo(String albumId, { String? parentId, AlbumWriteDto? albumWriteDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/internal/album/add/{albumId}'
      .replaceAll('{albumId}', albumId);

    // ignore: prefer_final_locals
    Object? postBody = albumWriteDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (parentId != null) {
      queryParams.addAll(_queryParams('', 'parentId', parentId));
    }

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
  /// * [String] albumId (required):
  ///
  /// * [String] parentId:
  ///
  /// * [AlbumWriteDto] albumWriteDto:
  Future<void> apiInternalAlbumAddAlbumIdPut(String albumId, { String? parentId, AlbumWriteDto? albumWriteDto, }) async {
    final response = await apiInternalAlbumAddAlbumIdPutWithHttpInfo(albumId,  parentId: parentId, albumWriteDto: albumWriteDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PATCH /api/internal/album/{albumId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] albumId (required):
  ///
  /// * [List<Operation>] operation:
  Future<Response> apiInternalAlbumAlbumIdPatchWithHttpInfo(String albumId, { List<Operation>? operation, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/internal/album/{albumId}'
      .replaceAll('{albumId}', albumId);

    // ignore: prefer_final_locals
    Object? postBody = operation;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
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
  /// * [List<Operation>] operation:
  Future<void> apiInternalAlbumAlbumIdPatch(String albumId, { List<Operation>? operation, }) async {
    final response = await apiInternalAlbumAlbumIdPatchWithHttpInfo(albumId,  operation: operation, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/internal/album/{albumId}/track/add/{trackId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] albumId (required):
  ///
  /// * [String] trackId (required):
  ///
  /// * [TrackWriteDto] trackWriteDto:
  Future<Response> apiInternalAlbumAlbumIdTrackAddTrackIdPutWithHttpInfo(String albumId, String trackId, { TrackWriteDto? trackWriteDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/internal/album/{albumId}/track/add/{trackId}'
      .replaceAll('{albumId}', albumId)
      .replaceAll('{trackId}', trackId);

    // ignore: prefer_final_locals
    Object? postBody = trackWriteDto;

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
  /// * [String] albumId (required):
  ///
  /// * [String] trackId (required):
  ///
  /// * [TrackWriteDto] trackWriteDto:
  Future<void> apiInternalAlbumAlbumIdTrackAddTrackIdPut(String albumId, String trackId, { TrackWriteDto? trackWriteDto, }) async {
    final response = await apiInternalAlbumAlbumIdTrackAddTrackIdPutWithHttpInfo(albumId, trackId,  trackWriteDto: trackWriteDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/internal/asset/add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Asset] asset:
  Future<Response> apiInternalAssetAddPutWithHttpInfo({ Asset? asset, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/internal/asset/add';

    // ignore: prefer_final_locals
    Object? postBody = asset;

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
  /// * [Asset] asset:
  Future<void> apiInternalAssetAddPut({ Asset? asset, }) async {
    final response = await apiInternalAssetAddPutWithHttpInfo( asset: asset, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/internal/asset/track/{trackId}/playlist' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] trackId (required):
  ///
  /// * [HlsPlaylistWriteDto] hlsPlaylistWriteDto:
  Future<Response> apiInternalAssetTrackTrackIdPlaylistPutWithHttpInfo(String trackId, { HlsPlaylistWriteDto? hlsPlaylistWriteDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/internal/asset/track/{trackId}/playlist'
      .replaceAll('{trackId}', trackId);

    // ignore: prefer_final_locals
    Object? postBody = hlsPlaylistWriteDto;

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
  /// * [String] trackId (required):
  ///
  /// * [HlsPlaylistWriteDto] hlsPlaylistWriteDto:
  Future<void> apiInternalAssetTrackTrackIdPlaylistPut(String trackId, { HlsPlaylistWriteDto? hlsPlaylistWriteDto, }) async {
    final response = await apiInternalAssetTrackTrackIdPlaylistPutWithHttpInfo(trackId,  hlsPlaylistWriteDto: hlsPlaylistWriteDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/internal/asset/track/{trackId}/segment' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] trackId (required):
  ///
  /// * [int] quality:
  ///
  /// * [HlsSegmentWriteDto] hlsSegmentWriteDto:
  Future<Response> apiInternalAssetTrackTrackIdSegmentPutWithHttpInfo(String trackId, { int? quality, HlsSegmentWriteDto? hlsSegmentWriteDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/internal/asset/track/{trackId}/segment'
      .replaceAll('{trackId}', trackId);

    // ignore: prefer_final_locals
    Object? postBody = hlsSegmentWriteDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (quality != null) {
      queryParams.addAll(_queryParams('', 'quality', quality));
    }

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
  /// * [String] trackId (required):
  ///
  /// * [int] quality:
  ///
  /// * [HlsSegmentWriteDto] hlsSegmentWriteDto:
  Future<void> apiInternalAssetTrackTrackIdSegmentPut(String trackId, { int? quality, HlsSegmentWriteDto? hlsSegmentWriteDto, }) async {
    final response = await apiInternalAssetTrackTrackIdSegmentPutWithHttpInfo(trackId,  quality: quality, hlsSegmentWriteDto: hlsSegmentWriteDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/internal/circle/add/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [CircleWriteDto] circleWriteDto:
  Future<Response> apiInternalCircleAddIdPutWithHttpInfo(String id, { CircleWriteDto? circleWriteDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/internal/circle/add/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = circleWriteDto;

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
  /// * [String] id (required):
  ///
  /// * [CircleWriteDto] circleWriteDto:
  Future<void> apiInternalCircleAddIdPut(String id, { CircleWriteDto? circleWriteDto, }) async {
    final response = await apiInternalCircleAddIdPutWithHttpInfo(id,  circleWriteDto: circleWriteDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PATCH /api/internal/circle/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [List<Operation>] operation:
  Future<Response> apiInternalCircleIdPatchWithHttpInfo(String id, { List<Operation>? operation, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/internal/circle/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = operation;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
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
  /// * [List<Operation>] operation:
  Future<void> apiInternalCircleIdPatch(String id, { List<Operation>? operation, }) async {
    final response = await apiInternalCircleIdPatchWithHttpInfo(id,  operation: operation, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PATCH /api/internal/track/jsonpatch/{trackId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] trackId (required):
  ///
  /// * [List<Operation>] operation:
  Future<Response> apiInternalTrackJsonpatchTrackIdPatchWithHttpInfo(String trackId, { List<Operation>? operation, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/internal/track/jsonpatch/{trackId}'
      .replaceAll('{trackId}', trackId);

    // ignore: prefer_final_locals
    Object? postBody = operation;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
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
  /// * [List<Operation>] operation:
  Future<void> apiInternalTrackJsonpatchTrackIdPatch(String trackId, { List<Operation>? operation, }) async {
    final response = await apiInternalTrackJsonpatchTrackIdPatchWithHttpInfo(trackId,  operation: operation, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PATCH /api/internal/track/{trackId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] trackId (required):
  ///
  /// * [TrackUpdateDto] trackUpdateDto:
  Future<Response> apiInternalTrackTrackIdPatchWithHttpInfo(String trackId, { TrackUpdateDto? trackUpdateDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/internal/track/{trackId}'
      .replaceAll('{trackId}', trackId);

    // ignore: prefer_final_locals
    Object? postBody = trackUpdateDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
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
  /// * [TrackUpdateDto] trackUpdateDto:
  Future<void> apiInternalTrackTrackIdPatch(String trackId, { TrackUpdateDto? trackUpdateDto, }) async {
    final response = await apiInternalTrackTrackIdPatchWithHttpInfo(trackId,  trackUpdateDto: trackUpdateDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
