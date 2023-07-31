# BackendClientApi.api.PlaylistApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPlaylist**](PlaylistApi.md#createplaylist) | **POST** /api/playlist | 
[**deletePlaylist**](PlaylistApi.md#deleteplaylist) | **DELETE** /api/playlist/{playlistId} | 
[**getCurrentUserFavorite**](PlaylistApi.md#getcurrentuserfavorite) | **GET** /api/playlist/user/me/favorite | 
[**getCurrentUserHistory**](PlaylistApi.md#getcurrentuserhistory) | **GET** /api/playlist/user/me/history | 
[**getCurrentUserPlaylist**](PlaylistApi.md#getcurrentuserplaylist) | **GET** /api/playlist/user/me | 
[**getCurrentUserQueue**](PlaylistApi.md#getcurrentuserqueue) | **GET** /api/playlist/user/me/queue | 
[**getPlaylist**](PlaylistApi.md#getplaylist) | **GET** /api/playlist | 
[**getUserPlaylist**](PlaylistApi.md#getuserplaylist) | **GET** /api/playlist/user/{userId} | 


# **createPlaylist**
> PlaylistReadDto createPlaylist(playlistCreateRequest)



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
final playlistCreateRequest = PlaylistCreateRequest(); // PlaylistCreateRequest | 

try {
    final result = api_instance.createPlaylist(playlistCreateRequest);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->createPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistCreateRequest** | [**PlaylistCreateRequest**](PlaylistCreateRequest.md)|  | [optional] 

### Return type

[**PlaylistReadDto**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePlaylist**
> bool deletePlaylist(playlistId)



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
    final result = api_instance.deletePlaylist(playlistId);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->deletePlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentUserFavorite**
> List<PlaylistReadDto> getCurrentUserFavorite()



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

[**List<PlaylistReadDto>**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentUserHistory**
> List<PlaylistReadDto> getCurrentUserHistory()



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

[**List<PlaylistReadDto>**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentUserPlaylist**
> List<PlaylistReadDto> getCurrentUserPlaylist()



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
    final result = api_instance.getCurrentUserPlaylist();
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->getCurrentUserPlaylist: $e\n');
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
> List<PlaylistReadDto> getCurrentUserQueue()



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

[**List<PlaylistReadDto>**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaylist**
> PlaylistReadDto getPlaylist(playlistId)



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
    final result = api_instance.getPlaylist(playlistId);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->getPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | [optional] 

### Return type

[**PlaylistReadDto**](PlaylistReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserPlaylist**
> List<PlaylistReadDto> getUserPlaylist(userId)



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
    final result = api_instance.getUserPlaylist(userId);
    print(result);
} catch (e) {
    print('Exception when calling PlaylistApi->getUserPlaylist: $e\n');
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

