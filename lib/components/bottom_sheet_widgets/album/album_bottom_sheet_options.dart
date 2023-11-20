import 'package:tlmc_player_flutter/components/bottom_sheet_widgets/album/album_bottom_sheet_builder.dart';

extension AlbumBotSheetQueueOptions on AlbumBottomSheetBuilder {
  AlbumBottomSheetBuilder withShufflePlay() {
    return addOption(null);
  }

  AlbumBottomSheetBuilder withPlayNext() {
    return addOption(null);
  }

  AlbumBottomSheetBuilder withAddToQueue() {
    return addOption(null);
  }

  AlbumBottomSheetBuilder withAddToPlaylist() {
    return addOption(null);
  }

  AlbumBottomSheetBuilder withGoToArtist() {
    return addOption(null);
  }
}
