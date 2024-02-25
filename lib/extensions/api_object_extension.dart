import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_app/models/track_info.dart';

extension TrackReadDtoExt on TrackReadDto {
  String get assetUrl => 'https://api-music.marisad.me/api/asset/track/$id';

  TrackInfo toTrackInfo() {
    var circles = album!.albumArtist!
        .map((e) => CircleInfo(
              circleId: e.id!,
              circleName: e.name!,
            ))
        .toList();

    String? albumArtUrl;
    if (album!.thumbnail != null) {
      albumArtUrl = album!.thumbnail!.large!.url!;
    }

    return TrackInfo(
      trackId: id!,
      trackTitle: name!.default_,
      trackAudioUrl: assetUrl,
      albumId: album!.id!,
      albumTitle: album!.albumName!.default_,
      artists: circles,
      albumArtUrl: albumArtUrl,
    );
  }
}
