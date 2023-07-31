# BackendClientApi.api.InternalApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiInternalAlbumAddAlbumIdPut**](InternalApi.md#apiinternalalbumaddalbumidput) | **PUT** /api/internal/album/add/{albumId} | 
[**apiInternalAlbumAlbumIdPatch**](InternalApi.md#apiinternalalbumalbumidpatch) | **PATCH** /api/internal/album/{albumId} | 
[**apiInternalAlbumAlbumIdTrackAddTrackIdPut**](InternalApi.md#apiinternalalbumalbumidtrackaddtrackidput) | **PUT** /api/internal/album/{albumId}/track/add/{trackId} | 
[**apiInternalAssetAddPut**](InternalApi.md#apiinternalassetaddput) | **PUT** /api/internal/asset/add | 
[**apiInternalAssetTrackTrackIdPlaylistPut**](InternalApi.md#apiinternalassettracktrackidplaylistput) | **PUT** /api/internal/asset/track/{trackId}/playlist | 
[**apiInternalAssetTrackTrackIdSegmentPut**](InternalApi.md#apiinternalassettracktrackidsegmentput) | **PUT** /api/internal/asset/track/{trackId}/segment | 
[**apiInternalCircleAddIdPut**](InternalApi.md#apiinternalcircleaddidput) | **PUT** /api/internal/circle/add/{id} | 
[**apiInternalCircleIdPatch**](InternalApi.md#apiinternalcircleidpatch) | **PATCH** /api/internal/circle/{id} | 
[**apiInternalTrackJsonpatchTrackIdPatch**](InternalApi.md#apiinternaltrackjsonpatchtrackidpatch) | **PATCH** /api/internal/track/jsonpatch/{trackId} | 
[**apiInternalTrackTrackIdPatch**](InternalApi.md#apiinternaltracktrackidpatch) | **PATCH** /api/internal/track/{trackId} | 


# **apiInternalAlbumAddAlbumIdPut**
> apiInternalAlbumAddAlbumIdPut(albumId, parentId, albumWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InternalApi();
final albumId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final parentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final albumWriteDto = AlbumWriteDto(); // AlbumWriteDto | 

try {
    api_instance.apiInternalAlbumAddAlbumIdPut(albumId, parentId, albumWriteDto);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalAlbumAddAlbumIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumId** | **String**|  | 
 **parentId** | **String**|  | [optional] 
 **albumWriteDto** | [**AlbumWriteDto**](AlbumWriteDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalAlbumAlbumIdPatch**
> apiInternalAlbumAlbumIdPatch(albumId, operation)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InternalApi();
final albumId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final operation = [List<Operation>()]; // List<Operation> | 

try {
    api_instance.apiInternalAlbumAlbumIdPatch(albumId, operation);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalAlbumAlbumIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumId** | **String**|  | 
 **operation** | [**List<Operation>**](Operation.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalAlbumAlbumIdTrackAddTrackIdPut**
> apiInternalAlbumAlbumIdTrackAddTrackIdPut(albumId, trackId, trackWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InternalApi();
final albumId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final trackId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final trackWriteDto = TrackWriteDto(); // TrackWriteDto | 

try {
    api_instance.apiInternalAlbumAlbumIdTrackAddTrackIdPut(albumId, trackId, trackWriteDto);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalAlbumAlbumIdTrackAddTrackIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumId** | **String**|  | 
 **trackId** | **String**|  | 
 **trackWriteDto** | [**TrackWriteDto**](TrackWriteDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalAssetAddPut**
> apiInternalAssetAddPut(asset)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InternalApi();
final asset = Asset(); // Asset | 

try {
    api_instance.apiInternalAssetAddPut(asset);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalAssetAddPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **asset** | [**Asset**](Asset.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalAssetTrackTrackIdPlaylistPut**
> apiInternalAssetTrackTrackIdPlaylistPut(trackId, hlsPlaylistWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InternalApi();
final trackId = trackId_example; // String | 
final hlsPlaylistWriteDto = HlsPlaylistWriteDto(); // HlsPlaylistWriteDto | 

try {
    api_instance.apiInternalAssetTrackTrackIdPlaylistPut(trackId, hlsPlaylistWriteDto);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalAssetTrackTrackIdPlaylistPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **trackId** | **String**|  | 
 **hlsPlaylistWriteDto** | [**HlsPlaylistWriteDto**](HlsPlaylistWriteDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalAssetTrackTrackIdSegmentPut**
> apiInternalAssetTrackTrackIdSegmentPut(trackId, quality, hlsSegmentWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InternalApi();
final trackId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final quality = 56; // int | 
final hlsSegmentWriteDto = HlsSegmentWriteDto(); // HlsSegmentWriteDto | 

try {
    api_instance.apiInternalAssetTrackTrackIdSegmentPut(trackId, quality, hlsSegmentWriteDto);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalAssetTrackTrackIdSegmentPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **trackId** | **String**|  | 
 **quality** | **int**|  | [optional] 
 **hlsSegmentWriteDto** | [**HlsSegmentWriteDto**](HlsSegmentWriteDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalCircleAddIdPut**
> apiInternalCircleAddIdPut(id, circleWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InternalApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final circleWriteDto = CircleWriteDto(); // CircleWriteDto | 

try {
    api_instance.apiInternalCircleAddIdPut(id, circleWriteDto);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalCircleAddIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **circleWriteDto** | [**CircleWriteDto**](CircleWriteDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalCircleIdPatch**
> apiInternalCircleIdPatch(id, operation)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InternalApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final operation = [List<Operation>()]; // List<Operation> | 

try {
    api_instance.apiInternalCircleIdPatch(id, operation);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalCircleIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **operation** | [**List<Operation>**](Operation.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalTrackJsonpatchTrackIdPatch**
> apiInternalTrackJsonpatchTrackIdPatch(trackId, operation)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InternalApi();
final trackId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final operation = [List<Operation>()]; // List<Operation> | 

try {
    api_instance.apiInternalTrackJsonpatchTrackIdPatch(trackId, operation);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalTrackJsonpatchTrackIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **trackId** | **String**|  | 
 **operation** | [**List<Operation>**](Operation.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalTrackTrackIdPatch**
> apiInternalTrackTrackIdPatch(trackId, trackUpdateDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = InternalApi();
final trackId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final trackUpdateDto = TrackUpdateDto(); // TrackUpdateDto | 

try {
    api_instance.apiInternalTrackTrackIdPatch(trackId, trackUpdateDto);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalTrackTrackIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **trackId** | **String**|  | 
 **trackUpdateDto** | [**TrackUpdateDto**](TrackUpdateDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

