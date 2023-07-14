# BackendClientApi.api.AuthApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getJwtPublicKey**](AuthApi.md#getjwtpublickey) | **GET** /api/auth/jwt/key | 
[**getNewToken**](AuthApi.md#getnewtoken) | **POST** /api/auth/token | 


# **getJwtPublicKey**
> JwtKeyResponse getJwtPublicKey()



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();

try {
    final result = api_instance.getJwtPublicKey();
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->getJwtPublicKey: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JwtKeyResponse**](JwtKeyResponse.md)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNewToken**
> JwtRenewResult getNewToken(body)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final body = String(); // String | 

try {
    final result = api_instance.getNewToken(body);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->getNewToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **String**|  | [optional] 

### Return type

[**JwtRenewResult**](JwtRenewResult.md)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

