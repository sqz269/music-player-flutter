# BackendClientApi.api.SearchApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**searchAlbums**](SearchApi.md#searchalbums) | **GET** /api/search/albums | 
[**searchTracks**](SearchApi.md#searchtracks) | **GET** /api/search/tracks | 


# **searchAlbums**
> Object searchAlbums(query, start, limit)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SearchApi();
final query = query_example; // String | 
final start = 56; // int | 
final limit = 56; // int | 

try {
    final result = api_instance.searchAlbums(query, start, limit);
    print(result);
} catch (e) {
    print('Exception when calling SearchApi->searchAlbums: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**|  | [optional] 
 **start** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**Object**](Object.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchTracks**
> Object searchTracks(query, start, limit)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SearchApi();
final query = query_example; // String | 
final start = 56; // int | 
final limit = 56; // int | 

try {
    final result = api_instance.searchTracks(query, start, limit);
    print(result);
} catch (e) {
    print('Exception when calling SearchApi->searchTracks: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**|  | [optional] 
 **start** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**Object**](Object.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

