# BackendClientApi.api.CircleApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCircleAlbumsById**](CircleApi.md#getcirclealbumsbyid) | **GET** /api/entity/circle/{id}/albums | 
[**getCircleAlbumsByName**](CircleApi.md#getcirclealbumsbyname) | **GET** /api/entity/circle/{name}/albums | 
[**getCircleById**](CircleApi.md#getcirclebyid) | **GET** /api/entity/circle/{id} | 
[**getCircleByName**](CircleApi.md#getcirclebyname) | **GET** /api/entity/circle/{name} | 
[**getCircles**](CircleApi.md#getcircles) | **GET** /api/entity/circle | 


# **getCircleAlbumsById**
> List<AlbumReadDto> getCircleAlbumsById(id, start, limit, sort, sortOrder)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CircleApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final start = 56; // int | 
final limit = 56; // int | 
final sort = ; // AlbumOrderOptions | 
final sortOrder = ; // SortOrder | 

try {
    final result = api_instance.getCircleAlbumsById(id, start, limit, sort, sortOrder);
    print(result);
} catch (e) {
    print('Exception when calling CircleApi->getCircleAlbumsById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **start** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]
 **sort** | [**AlbumOrderOptions**](.md)|  | [optional] 
 **sortOrder** | [**SortOrder**](.md)|  | [optional] 

### Return type

[**List<AlbumReadDto>**](AlbumReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCircleAlbumsByName**
> List<AlbumReadDto> getCircleAlbumsByName(name, start, limit, sort, sortOrder)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CircleApi();
final name = name_example; // String | 
final start = 56; // int | 
final limit = 56; // int | 
final sort = ; // AlbumOrderOptions | 
final sortOrder = ; // SortOrder | 

try {
    final result = api_instance.getCircleAlbumsByName(name, start, limit, sort, sortOrder);
    print(result);
} catch (e) {
    print('Exception when calling CircleApi->getCircleAlbumsByName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | 
 **start** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]
 **sort** | [**AlbumOrderOptions**](.md)|  | [optional] 
 **sortOrder** | [**SortOrder**](.md)|  | [optional] 

### Return type

[**List<AlbumReadDto>**](AlbumReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCircleById**
> CircleReadDto getCircleById(id)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CircleApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.getCircleById(id);
    print(result);
} catch (e) {
    print('Exception when calling CircleApi->getCircleById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**CircleReadDto**](CircleReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCircleByName**
> CircleReadDto getCircleByName(name)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CircleApi();
final name = name_example; // String | 

try {
    final result = api_instance.getCircleByName(name);
    print(result);
} catch (e) {
    print('Exception when calling CircleApi->getCircleByName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | 

### Return type

[**CircleReadDto**](CircleReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCircles**
> List<CircleReadDto> getCircles(start, limit)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CircleApi();
final start = 56; // int | 
final limit = 56; // int | 

try {
    final result = api_instance.getCircles(start, limit);
    print(result);
} catch (e) {
    print('Exception when calling CircleApi->getCircles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**List<CircleReadDto>**](CircleReadDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

