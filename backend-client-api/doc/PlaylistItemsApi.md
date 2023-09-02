# BackendClientApi.api.PlaylistItemsApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addTrackToPlaylist**](PlaylistItemsApi.md#addtracktoplaylist) | **POST** /api/playlists/{playlistId}/tracks | 
[**deleteTrackFromPlaylist**](PlaylistItemsApi.md#deletetrackfromplaylist) | **DELETE** /api/playlists/{playlistId}/tracks | 
[**getPlaylistItems**](PlaylistItemsApi.md#getplaylistitems) | **GET** /api/playlists/{playlistId}/tracks | 


# **addTrackToPlaylist**
> List<PlaylistItemReadDto> addTrackToPlaylist(playlistId, requestBody)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistItemsApi();
final playlistId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final requestBody = [List<String>()]; // List<String> | 

try {
    final result = api_instance.addTrackToPlaylist(playlistId, requestBody);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistItemsApi->addTrackToPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **requestBody** | [**List<String>**](String.md)|  | [optional] 

### Return type

[**List<PlaylistItemReadDto>**](PlaylistItemReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTrackFromPlaylist**
> deleteTrackFromPlaylist(playlistId, requestBody)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistItemsApi();
final playlistId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final requestBody = [List<String>()]; // List<String> | 

try {
    api_instance.deleteTrackFromPlaylist(playlistId, requestBody);
} catch (e) {
    print('Exception when calling PlaylistItemsApi->deleteTrackFromPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **requestBody** | [**List<String>**](String.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaylistItems**
> List<PlaylistItemReadDto> getPlaylistItems(playlistId, start, limit)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistItemsApi();
final playlistId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final start = 56; // int | 
final limit = 56; // int | 

try {
    final result = api_instance.getPlaylistItems(playlistId, start, limit);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistItemsApi->getPlaylistItems: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **start** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**List<PlaylistItemReadDto>**](PlaylistItemReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

