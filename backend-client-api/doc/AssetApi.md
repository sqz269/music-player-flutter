# BackendClientApi.api.AssetApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAsset**](AssetApi.md#getasset) | **GET** /api/asset/{id} | 


# **getAsset**
> getAsset(id)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = AssetApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api_instance.getAsset(id);
} catch (e) {
    print('Exception when calling AssetApi->getAsset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

