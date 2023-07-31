# BackendClientApi.model.AlbumReadDto

## Load the model package
```dart
import 'package:BackendClientApi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**albumName** | [**LocalizedField**](LocalizedField.md) |  | [optional] 
**releaseDate** | [**DateTime**](DateTime.md) |  | [optional] 
**releaseConvention** | **String** |  | [optional] 
**catalogNumber** | **String** |  | [optional] 
**numberOfDiscs** | **int** |  | [optional] 
**discNumber** | **int** |  | [optional] 
**discName** | **String** |  | [optional] 
**website** | **List<String>** |  | [optional] [default to const []]
**albumArtist** | [**List<CircleReadDto>**](CircleReadDto.md) |  | [optional] [default to const []]
**dataSource** | **List<String>** |  | [optional] [default to const []]
**tracks** | [**List<TrackReadDto>**](TrackReadDto.md) |  | [optional] [default to const []]
**childAlbums** | [**List<AlbumReadDto>**](AlbumReadDto.md) |  | [optional] [default to const []]
**parentAlbum** | [**AlbumReadDto**](AlbumReadDto.md) |  | [optional] 
**thumbnail** | [**ThumbnailReadDto**](ThumbnailReadDto.md) |  | [optional] 
**otherFiles** | [**List<AssetReadDto>**](AssetReadDto.md) |  | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


