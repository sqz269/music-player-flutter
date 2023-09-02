# BackendClientApi.api.PlaylistApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addPlaylist**](PlaylistApi.md#addplaylist) | **POST** /api/playlists | 
[**apiPlaylistsUserUserIdGet**](PlaylistApi.md#apiplaylistsuseruseridget) | **GET** /api/playlists/user/{userId} | 
[**deletePlaylist**](PlaylistApi.md#deleteplaylist) | **DELETE** /api/playlists/{playlistId} | 
[**getCurrentUserFavorite**](PlaylistApi.md#getcurrentuserfavorite) | **GET** /api/playlists/me/favorite | 
[**getCurrentUserHistory**](PlaylistApi.md#getcurrentuserhistory) | **GET** /api/playlists/me/history | 
[**getCurrentUserPlaylists**](PlaylistApi.md#getcurrentuserplaylists) | **GET** /api/playlists/me | 
[**getCurrentUserQueue**](PlaylistApi.md#getcurrentuserqueue) | **GET** /api/playlists/me/queue | 
[**getPlaylistById**](PlaylistApi.md#getplaylistbyid) | **GET** /api/playlists/{playlistId} | 
[**updatePlaylistInfo**](PlaylistApi.md#updateplaylistinfo) | **PUT** /api/playlists/{playlistId} | 


# **addPlaylist**
> PlaylistReadDto addPlaylist(playlistInfo)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistApi();
final playlistInfo = PlaylistInfo(); // PlaylistInfo | 

try {
    final result = api_instance.addPlaylist(playlistInfo);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->addPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistInfo** | [**PlaylistInfo**](PlaylistInfo.md)|  | [optional] 

### Return type

[**PlaylistReadDto**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPlaylistsUserUserIdGet**
> List<PlaylistReadDto> apiPlaylistsUserUserIdGet(userId)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistApi();
final userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.apiPlaylistsUserUserIdGet(userId);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->apiPlaylistsUserUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**List<PlaylistReadDto>**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePlaylist**
> deletePlaylist(playlistId)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistApi();
final playlistId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api_instance.deletePlaylist(playlistId);
} catch (e) {
    print('Exception when calling PlaylistApi->deletePlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentUserFavorite**
> PlaylistReadDto getCurrentUserFavorite()



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistApi();

try {
    final result = api_instance.getCurrentUserFavorite();
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->getCurrentUserFavorite: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PlaylistReadDto**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentUserHistory**
> PlaylistReadDto getCurrentUserHistory()



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistApi();

try {
    final result = api_instance.getCurrentUserHistory();
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->getCurrentUserHistory: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PlaylistReadDto**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentUserPlaylists**
> List<PlaylistReadDto> getCurrentUserPlaylists()



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistApi();

try {
    final result = api_instance.getCurrentUserPlaylists();
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->getCurrentUserPlaylists: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<PlaylistReadDto>**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentUserQueue**
> PlaylistReadDto getCurrentUserQueue()



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistApi();

try {
    final result = api_instance.getCurrentUserQueue();
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->getCurrentUserQueue: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PlaylistReadDto**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaylistById**
> PlaylistReadDto getPlaylistById(playlistId)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistApi();
final playlistId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.getPlaylistById(playlistId);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->getPlaylistById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 

### Return type

[**PlaylistReadDto**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePlaylistInfo**
> PlaylistReadDto updatePlaylistInfo(playlistId, playlistInfo)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PlaylistApi();
final playlistId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final playlistInfo = PlaylistInfo(); // PlaylistInfo | 

try {
    final result = api_instance.updatePlaylistInfo(playlistId, playlistInfo);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->updatePlaylistInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **playlistInfo** | [**PlaylistInfo**](PlaylistInfo.md)|  | [optional] 

### Return type

[**PlaylistReadDto**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

