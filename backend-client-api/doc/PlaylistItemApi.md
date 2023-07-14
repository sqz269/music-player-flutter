# BackendClientApi.api.PlaylistItemApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addPlaylistItemToPlaylist**](PlaylistItemApi.md#addplaylistitemtoplaylist) | **POST** /api/playlistItem | 
[**deletePlaylistItemFromPlaylist**](PlaylistItemApi.md#deleteplaylistitemfromplaylist) | **DELETE** /api/playlistItem | 


# **addPlaylistItemToPlaylist**
> PlaylistItemReadDto addPlaylistItemToPlaylist(playlistItemAddRequest)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = PlaylistItemApi();
final playlistItemAddRequest = PlaylistItemAddRequest(); // PlaylistItemAddRequest | 

try {
    final result = api_instance.addPlaylistItemToPlaylist(playlistItemAddRequest);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistItemApi->addPlaylistItemToPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistItemAddRequest** | [**PlaylistItemAddRequest**](PlaylistItemAddRequest.md)|  | [optional] 

### Return type

[**PlaylistItemReadDto**](PlaylistItemReadDto.md)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePlaylistItemFromPlaylist**
> deletePlaylistItemFromPlaylist(playlistItemDeleteRequest)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = PlaylistItemApi();
final playlistItemDeleteRequest = PlaylistItemDeleteRequest(); // PlaylistItemDeleteRequest | 

try {
    api_instance.deletePlaylistItemFromPlaylist(playlistItemDeleteRequest);
} catch (e) {
    print('Exception when calling PlaylistItemApi->deletePlaylistItemFromPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistItemDeleteRequest** | [**PlaylistItemDeleteRequest**](PlaylistItemDeleteRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

