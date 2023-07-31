# BackendClientApi.api.HlsAssetApi

## Load the API package
```dart
import 'package:BackendClientApi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAssetTrackTrackIdGet**](HlsAssetApi.md#apiassettracktrackidget) | **GET** /api/asset/track/{trackId} | 
[**apiAssetTrackTrackIdHlsQualitykSegmentGet**](HlsAssetApi.md#apiassettracktrackidhlsqualityksegmentget) | **GET** /api/asset/track/{trackId}/hls/{quality}k/{segment} | 
[**getMediaPlaylist**](HlsAssetApi.md#getmediaplaylist) | **GET** /api/asset/track/{trackId}/hls/{quality}k/playlist.m3u8 | 


# **apiAssetTrackTrackIdGet**
> apiAssetTrackTrackIdGet(trackId)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = HlsAssetApi();
final trackId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api_instance.apiAssetTrackTrackIdGet(trackId);
} catch (e) {
    print('Exception when calling HlsAssetApi->apiAssetTrackTrackIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **trackId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAssetTrackTrackIdHlsQualitykSegmentGet**
> apiAssetTrackTrackIdHlsQualitykSegmentGet(trackId, quality, segment)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = HlsAssetApi();
final trackId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final quality = 56; // int | 
final segment = segment_example; // String | 

try {
    api_instance.apiAssetTrackTrackIdHlsQualitykSegmentGet(trackId, quality, segment);
} catch (e) {
    print('Exception when calling HlsAssetApi->apiAssetTrackTrackIdHlsQualitykSegmentGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **trackId** | **String**|  | 
 **quality** | **int**|  | 
 **segment** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaPlaylist**
> getMediaPlaylist(trackId, quality)



### Example
```dart
import 'package:BackendClientApi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = HlsAssetApi();
final trackId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final quality = 56; // int | 

try {
    api_instance.getMediaPlaylist(trackId, quality);
} catch (e) {
    print('Exception when calling HlsAssetApi->getMediaPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **trackId** | **String**|  | 
 **quality** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

