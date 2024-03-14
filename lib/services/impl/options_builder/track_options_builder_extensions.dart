import 'package:tlmc_player_app/services/impl/options_builder/track_options.dart';
import 'package:tlmc_player_app/services/impl/options_builder/track_options_builder.dart';

extension TrackOptionsBuilderExtension on TrackOptionsBuilder {
  TrackOptionsBuilder withPlayNext() {
    return addOption(TrackOptionPlayNext(trackId));
  }

  TrackOptionsBuilder withAddToQueue() {
    return addOption(TrackOptionAddToQueue(trackId));
  }

  TrackOptionsBuilder withAddToPlaylist() {
    return addOption(TrackOptionAddToPlaylist(trackId));
  }

  TrackOptionsBuilder withGotoArtist() {
    return addOption(TrackOptionGotoArtist(trackId));
  }

  TrackOptionsBuilder withGotoAlbum() {
    return addOption(TrackOptionGotoAlbum(trackId));
  }
}
