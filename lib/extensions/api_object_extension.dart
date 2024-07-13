import 'package:backend_client_api/api.dart';
import 'package:tlmc_player_app/global_configuration.dart';
import 'package:tlmc_player_app/models/track_info.dart';

extension TrackReadDtoExt on TrackReadDto {
  String get assetUrl =>
      '${GlobalConfiguration.API_BASE_URL}/api/asset/track/$id';

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
      albumTitle: album!.name!.default_,
      artists: circles,
      albumArtUrl: albumArtUrl,
    );
  }
}
