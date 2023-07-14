# BackendClientApi.api.UserApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiUserLogoutPost**](UserApi.md#apiuserlogoutpost) | **POST** /api/user/logout | 
[**getAllUsers**](UserApi.md#getallusers) | **GET** /api/user/all | 
[**login**](UserApi.md#login) | **POST** /api/user/login | 
[**register**](UserApi.md#register) | **POST** /api/user/register | 


# **apiUserLogoutPost**
> OkResult apiUserLogoutPost(body)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = UserApi();
final body = String(); // String | 

try {
    final result = api_instance.apiUserLogoutPost(body);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserLogoutPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **String**|  | [optional] 

### Return type

[**OkResult**](OkResult.md)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllUsers**
> List<User> getAllUsers()



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = UserApi();

try {
    final result = api_instance.getAllUsers();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->getAllUsers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<User>**](User.md)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> LoginResult login(userCredentialsDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = UserApi();
final userCredentialsDto = UserCredentialsDto(); // UserCredentialsDto | 

try {
    final result = api_instance.login(userCredentialsDto);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userCredentialsDto** | [**UserCredentialsDto**](UserCredentialsDto.md)|  | [optional] 

### Return type

[**LoginResult**](LoginResult.md)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **register**
> Object register(userCredentialsDto)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = UserApi();
final userCredentialsDto = UserCredentialsDto(); // UserCredentialsDto | 

try {
    final result = api_instance.register(userCredentialsDto);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->register: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userCredentialsDto** | [**UserCredentialsDto**](UserCredentialsDto.md)|  | [optional] 

### Return type

[**Object**](Object.md)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

