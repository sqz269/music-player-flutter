# BackendClientApi.api.RadioApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiRadioGet**](RadioApi.md#apiradioget) | **GET** /api/radio | 


# **apiRadioGet**
> RadioSong apiRadioGet()



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure API key authorization: Jwt
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Jwt').apiKeyPrefix = 'Bearer';

final api_instance = RadioApi();

try {
    final result = api_instance.apiRadioGet();
    print(result);
} catch (e) {
    print('Exception when calling RadioApi->apiRadioGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**RadioSong**](RadioSong.md)

### Authorization

[Jwt](../README.md#Jwt)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

