# BackendClientApi.api.InternalApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiInternalAlbumAddAlbumIdPost**](InternalApi.md#apiinternalalbumaddalbumidpost) | **POST** /api/internal/album/add/{albumId} | 
[**apiInternalAlbumAlbumIdPatch**](InternalApi.md#apiinternalalbumalbumidpatch) | **PATCH** /api/internal/album/{albumId} | 
[**apiInternalAlbumAlbumIdTrackAddTrackIdPost**](InternalApi.md#apiinternalalbumalbumidtrackaddtrackidpost) | **POST** /api/internal/album/{albumId}/track/add/{trackId} | 
[**apiInternalAssetAddPost**](InternalApi.md#apiinternalassetaddpost) | **POST** /api/internal/asset/add | 
[**apiInternalCircleAddIdPut**](InternalApi.md#apiinternalcircleaddidput) | **PUT** /api/internal/circle/add/{id} | 
[**apiInternalCircleIdPatch**](InternalApi.md#apiinternalcircleidpatch) | **PATCH** /api/internal/circle/{id} | 
[**apiInternalTrackTrackIdPatch**](InternalApi.md#apiinternaltracktrackidpatch) | **PATCH** /api/internal/track/{trackId} | 


# **apiInternalAlbumAddAlbumIdPost**
> apiInternalAlbumAddAlbumIdPost(albumId, albumWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = InternalApi();
final albumId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final albumWriteDto = AlbumWriteDto(); // AlbumWriteDto | 

try {
    api_instance.apiInternalAlbumAddAlbumIdPost(albumId, albumWriteDto);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalAlbumAddAlbumIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumId** | **String**|  | 
 **albumWriteDto** | [**AlbumWriteDto**](AlbumWriteDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalAlbumAlbumIdPatch**
> apiInternalAlbumAlbumIdPatch(albumId, operation)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

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

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalAlbumAlbumIdTrackAddTrackIdPost**
> apiInternalAlbumAlbumIdTrackAddTrackIdPost(albumId, trackId, trackWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = InternalApi();
final albumId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final trackId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final trackWriteDto = TrackWriteDto(); // TrackWriteDto | 

try {
    api_instance.apiInternalAlbumAlbumIdTrackAddTrackIdPost(albumId, trackId, trackWriteDto);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalAlbumAlbumIdTrackAddTrackIdPost: $e\n');
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

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalAssetAddPost**
> apiInternalAssetAddPost(asset)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = InternalApi();
final asset = Asset(); // Asset | 

try {
    api_instance.apiInternalAssetAddPost(asset);
} catch (e) {
    print('Exception when calling InternalApi->apiInternalAssetAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **asset** | [**Asset**](Asset.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalCircleAddIdPut**
> apiInternalCircleAddIdPut(id, circleWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

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

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalCircleIdPatch**
> apiInternalCircleIdPatch(id, operation)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

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

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiInternalTrackTrackIdPatch**
> apiInternalTrackTrackIdPatch(trackId, trackUpdateDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

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

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

