# BackendClientApi.model.TrackReadDto1

## Load the model package
```dart
import 'package:BackendClientApi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**name** | [**LocalizedField1**](LocalizedField1.md) |  | [optional] 
**index** | **int** |  | [optional] 
**disc** | **int** |  | [optional] 
**duration** | **String** |  | [optional] 
**genre** | **List<String>** |  | [optional] [default to const []]
**staff** | **List<String>** |  | [optional] [default to const []]
**arrangement** | **List<String>** |  | [optional] [default to const []]
**vocalist** | **List<String>** |  | [optional] [default to const []]
**lyricist** | **List<String>** |  | [optional] [default to const []]
**original** | [**List<OriginalTrackReadDto>**](OriginalTrackReadDto.md) |  | [optional] [default to const []]
**originalNonTouhou** | **bool** |  | [optional] 
**album** | [**AlbumReadDto1**](AlbumReadDto1.md) |  | [optional] 
**trackFile** | [**AssetReadDto**](AssetReadDto.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


