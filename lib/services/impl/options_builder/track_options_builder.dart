import 'dart:ui';

import 'package:backend_client_api/api.dart';
import 'package:tlmc_player_app/services/impl/options_builder/i_track_option.dart';

final class TrackOptionsBuilder {
  final List<ITrackOption> _options = [];
  final TrackReadDto track;

  TrackOptionsBuilder({required this.track});

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
