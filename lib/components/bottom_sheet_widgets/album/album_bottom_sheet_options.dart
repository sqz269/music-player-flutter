import 'package:tlmc_player_flutter/components/bottom_sheet_widgets/album/album_bottom_sheet_builder.dart';

extension AlbumBotSheetQueueOptions on AlbumBottomSheetBuilder {
  AlbumBottomSheetBuilder withShufflePlay() {
    return this.addOption(null);
  }

  AlbumBottomSheetBuilder withPlayNext() {
    return this.addOption(null);
  }

  AlbumBottomSheetBuilder withAddToQueue() {
    return this.addOption(null);
  }

  AlbumBottomSheetBuilder withAddToPlaylist() {
    return this.addOption(null);
  }

  AlbumBottomSheetBuilder withGoToArtist() {
    return this.addOption(null);
  }
}
