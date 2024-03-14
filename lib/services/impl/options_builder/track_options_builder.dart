import 'dart:ui';

import 'package:tlmc_player_app/services/api/options_builder/i_track_option.dart';

final class TrackOptionsBuilder {
  final List<ITrackOption> _options = [];
  final String trackId;

  TrackOptionsBuilder({required this.trackId});

  TrackOptionsBuilder addOption(ITrackOption? option) {
    if (option != null) _options.add(option);

    return this;
  }

  TrackOptionsBuilder withCallback(VoidCallback callback) {
    if (_options.isNotEmpty) {
      _options.last.addCallback(callback);
    }

    return this;
  }

  TrackOptions build() {
    return TrackOptions(_options);
  }
}
