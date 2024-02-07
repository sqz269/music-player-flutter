import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_app/models/track_info.dart';

extension TrackReadDtoExt on TrackReadDto {
  String get assetUrl => 'https://api-music.marisad.me/api/asset/track/$id';

  TrackInfo toTrackInfo() {
    return TrackInfo(
      trackId: id!,
      trackTitle: name!.default_,
      trackAudioUrl: assetUrl,
      albumTitle: album!.albumName!.default_,
      artists: album!.albumArtist!.map((e) => e.name!).toList(),
      albumArtUrl: album!.thumbnail!.large!.url!,
    );
  }
}
