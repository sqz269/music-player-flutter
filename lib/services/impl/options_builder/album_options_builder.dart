import 'dart:ui';

import 'package:tlmc_player_app/services/api/options_builder/i_album_option.dart';

final class AlbumOptionsBuilder {
  final List<IAlbumOption> _options = [];
  final String albumId;

  AlbumOptionsBuilder({required this.albumId});

  AlbumOptionsBuilder addOption(IAlbumOption? option) {
    if (option != null) _options.add(option);

    return this;
  }

  AlbumOptionsBuilder withCallback(VoidCallback callback) {
    if (_options.isNotEmpty) {
      _options.last.addCallback(callback);
    }

    return this;
  }

  AlbumOptions build() {
    return AlbumOptions(_options);
  }
}
