# BackendClientApi.api.AlbumApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addAlbum**](AlbumApi.md#addalbum) | **POST** /api/music/album/create | 
[**addTrack**](AlbumApi.md#addtrack) | **POST** /api/music/album/{albumId}/track/create | 
[**getAlbum**](AlbumApi.md#getalbum) | **GET** /api/music/album/{id} | 
[**getAlbumFiltered**](AlbumApi.md#getalbumfiltered) | **GET** /api/music/album/filter | 
[**getAlbums**](AlbumApi.md#getalbums) | **GET** /api/music/album | 
[**getAlbumsByIds**](AlbumApi.md#getalbumsbyids) | **POST** /api/music/album | 
[**getRandomSampleTrack**](AlbumApi.md#getrandomsampletrack) | **GET** /api/music/random | 
[**getTrack**](AlbumApi.md#gettrack) | **GET** /api/music/track/{id} | 
[**getTracks**](AlbumApi.md#gettracks) | **POST** /api/music/track | 


# **addAlbum**
> AlbumReadDto addAlbum(albumWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AlbumApi();
final albumWriteDto = AlbumWriteDto(); // AlbumWriteDto | 

try {
    final result = api_instance.addAlbum(albumWriteDto);
    print(result);
} catch (e) {
    print('Exception when calling AlbumApi->addAlbum: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumWriteDto** | [**AlbumWriteDto**](AlbumWriteDto.md)|  | [optional] 

### Return type

[**AlbumReadDto**](AlbumReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addTrack**
> TrackReadDto addTrack(albumId, trackWriteDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AlbumApi();
final albumId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final trackWriteDto = TrackWriteDto(); // TrackWriteDto | 

try {
    final result = api_instance.addTrack(albumId, trackWriteDto);
    print(result);
} catch (e) {
    print('Exception when calling AlbumApi->addTrack: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **albumId** | **String**|  | 
 **trackWriteDto** | [**TrackWriteDto**](TrackWriteDto.md)|  | [optional] 

### Return type

[**TrackReadDto**](TrackReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAlbum**
> AlbumReadDto getAlbum(id)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AlbumApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.getAlbum(id);
    print(result);
} catch (e) {
    print('Exception when calling AlbumApi->getAlbum: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AlbumReadDto**](AlbumReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAlbumFiltered**
> List<AlbumReadDto> getAlbumFiltered(title, releaseDateBegin, releaseDateEnd, convention, catalog, artist, artistId, start, limit)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AlbumApi();
final title = title_example; // String | 
final releaseDateBegin = 2013-10-20T19:20:30+01:00; // DateTime | 
final releaseDateEnd = 2013-10-20T19:20:30+01:00; // DateTime | 
final convention = convention_example; // String | 
final catalog = catalog_example; // String | 
final artist = artist_example; // String | 
final artistId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final start = 56; // int | 
final limit = 56; // int | 

try {
    final result = api_instance.getAlbumFiltered(title, releaseDateBegin, releaseDateEnd, convention, catalog, artist, artistId, start, limit);
    print(result);
} catch (e) {
    print('Exception when calling AlbumApi->getAlbumFiltered: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **title** | **String**|  | [optional] 
 **releaseDateBegin** | **DateTime**|  | [optional] 
 **releaseDateEnd** | **DateTime**|  | [optional] 
 **convention** | **String**|  | [optional] 
 **catalog** | **String**|  | [optional] 
 **artist** | **String**|  | [optional] 
 **artistId** | **String**|  | [optional] 
 **start** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**List<AlbumReadDto>**](AlbumReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAlbums**
> List<AlbumReadDto> getAlbums(start, limit)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AlbumApi();
final start = 56; // int | 
final limit = 56; // int | 

try {
    final result = api_instance.getAlbums(start, limit);
    print(result);
} catch (e) {
    print('Exception when calling AlbumApi->getAlbums: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**List<AlbumReadDto>**](AlbumReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAlbumsByIds**
> List<AlbumReadDto> getAlbumsByIds(requestBody)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AlbumApi();
final requestBody = [List<String>()]; // List<String> | 

try {
    final result = api_instance.getAlbumsByIds(requestBody);
    print(result);
} catch (e) {
    print('Exception when calling AlbumApi->getAlbumsByIds: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestBody** | [**List<String>**](String.md)|  | [optional] 

### Return type

[**List<AlbumReadDto>**](AlbumReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRandomSampleTrack**
> List<TrackReadDto> getRandomSampleTrack(limit)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AlbumApi();
final limit = 56; // int | 

try {
    final result = api_instance.getRandomSampleTrack(limit);
    print(result);
} catch (e) {
    print('Exception when calling AlbumApi->getRandomSampleTrack: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**List<TrackReadDto>**](TrackReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTrack**
> TrackReadDto getTrack(id)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AlbumApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.getTrack(id);
    print(result);
} catch (e) {
    print('Exception when calling AlbumApi->getTrack: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**TrackReadDto**](TrackReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTracks**
> TrackGetMultipleResp getTracks(requestBody)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AlbumApi();
final requestBody = [List<String>()]; // List<String> | 

try {
    final result = api_instance.getTracks(requestBody);
    print(result);
} catch (e) {
    print('Exception when calling AlbumApi->getTracks: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestBody** | [**List<String>**](String.md)|  | [optional] 

### Return type

[**TrackGetMultipleResp**](TrackGetMultipleResp.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

