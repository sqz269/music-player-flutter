import 'dart:ui';

import 'package:backend_client_api/api.dart';
import 'package:tlmc_player_app/services/api/options_builder/i_album_option.dart';

final class AlbumOptionsBuilder {
  final List<IAlbumOption> _options = [];
  final AlbumReadDto album;

  AlbumOptionsBuilder({required this.album});

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
