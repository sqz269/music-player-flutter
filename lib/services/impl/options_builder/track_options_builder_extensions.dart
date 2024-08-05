import 'package:tlmc_player_app/services/impl/options_builder/track_options.dart';
import 'package:tlmc_player_app/services/impl/options_builder/track_options_builder.dart';

extension TrackOptionsBuilderExtension on TrackOptionsBuilder {
  TrackOptionsBuilder withPlayNext() {
    return addOption(TrackOptionPlayNext(track));
  }

  TrackOptionsBuilder withAddToQueue() {
    return addOption(TrackOptionAddToQueue(track));
  }

  TrackOptionsBuilder withAddToPlaylist() {
    return addOption(TrackOptionAddToPlaylist(track));
  }

  TrackOptionsBuilder withGotoArtist() {
    return addOption(TrackOptionGotoArtist(track));
  }

  TrackOptionsBuilder withGotoAlbum() {
    return addOption(TrackOptionGotoAlbum(track));
  }
}
