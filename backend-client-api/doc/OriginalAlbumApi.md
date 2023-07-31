# BackendClientApi.api.OriginalAlbumApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addOriginalAlbum**](OriginalAlbumApi.md#addoriginalalbum) | **POST** /api/source/album | 
[**addOriginalTrack**](OriginalAlbumApi.md#addoriginaltrack) | **POST** /api/source/album/{albumId}/track | 
[**getOriginalAlbum**](OriginalAlbumApi.md#getoriginalalbum) | **GET** /api/source/album/{id} | 
[**getOriginalAlbums**](OriginalAlbumApi.md#getoriginalalbums) | **GET** /api/source/album | 
[**getOriginalTrack**](OriginalAlbumApi.md#getoriginaltrack) | **GET** /api/source/track/{id} | 
[**getOriginalTracks**](OriginalAlbumApi.md#getoriginaltracks) | **GET** /api/source/track | 


# **addOriginalAlbum**
> OriginalAlbumReadDtoActionResult addOriginalAlbum(originalAlbumWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OriginalAlbumApi();
final originalAlbumWriteDto = OriginalAlbumWriteDto(); // OriginalAlbumWriteDto | 

try {
    final result = api_instance.addOriginalAlbum(originalAlbumWriteDto);
    print(result);
} catch (e) {
    print('Exception when calling OriginalAlbumApi->addOriginalAlbum: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **originalAlbumWriteDto** | [**OriginalAlbumWriteDto**](OriginalAlbumWriteDto.md)|  | [optional] 

### Return type

[**OriginalAlbumReadDtoActionResult**](OriginalAlbumReadDtoActionResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addOriginalTrack**
> OriginalTrackReadDtoActionResult addOriginalTrack(albumId, originalTrackWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OriginalAlbumApi();
final albumId = albumId_example; // String | 
final originalTrackWriteDto = OriginalTrackWriteDto(); // OriginalTrackWriteDto | 

try {
    final result = api_instance.addOriginalTrack(albumId, originalTrackWriteDto);
    print(result);
} catch (e) {
    print('Exception when calling OriginalAlbumApi->addOriginalTrack: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumId** | **String**|  | 
 **originalTrackWriteDto** | [**OriginalTrackWriteDto**](OriginalTrackWriteDto.md)|  | [optional] 

### Return type

[**OriginalTrackReadDtoActionResult**](OriginalTrackReadDtoActionResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOriginalAlbum**
> OriginalAlbumReadDto getOriginalAlbum(id)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OriginalAlbumApi();
final id = id_example; // String | 

try {
    final result = api_instance.getOriginalAlbum(id);
    print(result);
} catch (e) {
    print('Exception when calling OriginalAlbumApi->getOriginalAlbum: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**OriginalAlbumReadDto**](OriginalAlbumReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOriginalAlbums**
> List<OriginalAlbumReadDto> getOriginalAlbums(start, limit)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OriginalAlbumApi();
final start = 56; // int | 
final limit = 56; // int | 

try {
    final result = api_instance.getOriginalAlbums(start, limit);
    print(result);
} catch (e) {
    print('Exception when calling OriginalAlbumApi->getOriginalAlbums: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**List<OriginalAlbumReadDto>**](OriginalAlbumReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOriginalTrack**
> OriginalTrackReadDto getOriginalTrack(id)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OriginalAlbumApi();
final id = id_example; // String | 

try {
    final result = api_instance.getOriginalTrack(id);
    print(result);
} catch (e) {
    print('Exception when calling OriginalAlbumApi->getOriginalTrack: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**OriginalTrackReadDto**](OriginalTrackReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOriginalTracks**
> List<OriginalTrackReadDto> getOriginalTracks(start, limit)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OriginalAlbumApi();
final start = 56; // int | 
final limit = 56; // int | 

try {
    final result = api_instance.getOriginalTracks(start, limit);
    print(result);
} catch (e) {
    print('Exception when calling OriginalAlbumApi->getOriginalTracks: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**List<OriginalTrackReadDto>**](OriginalTrackReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

