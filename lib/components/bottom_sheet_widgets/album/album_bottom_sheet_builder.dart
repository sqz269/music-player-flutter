import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_flutter/components/bottom_sheet_widgets/album/I_album_sheet_option.dart';

class AlbumBottomSheetBuilder {
  final List<IAlbumBotSheetOption> _options = [];
  final AlbumReadDto masterAlbum;
  final List<AlbumReadDto> albums;

  AlbumBottomSheetBuilder({required this.masterAlbum, this.albums = const []}) {
    albums.add(masterAlbum);
  }

  AlbumBottomSheetBuilder addOption(IAlbumBotSheetOption? option) {
    if (option == null) {
      return this;
    }
    _options.add(option);
    return this;
  }

  AlbumBottomSheetBuilder withCallBack(VoidCallback callback) {
    _options.last.addCallback(callback);
    return this;
  }

  AlbumBottomSheet build() {
    return AlbumBottomSheet(
      masterAlbum: masterAlbum,
      albums: albums,
      options: _options,
    );
  }
}

class AlbumBottomSheet extends StatefulWidget {
  final List<IAlbumBotSheetOption> options;

  final AlbumReadDto masterAlbum;
  final List<AlbumReadDto> albums;

  const AlbumBottomSheet({
    required this.masterAlbum,
    this.albums = const [],
    required this.options,
    super.key,
  });

  @override
  State<AlbumBottomSheet> createState() => _AlbumBottomSheetState();
}

class _AlbumBottomSheetState extends State<AlbumBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Image.network(
                widget.masterAlbum.thumbnail!.medium!.url!,
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
              title: RichText(
                text: TextSpan(
                  text: widget.masterAlbum.albumName!.default_,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: '\n${widget.masterAlbum.albumArtist![0].name}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              onTap: null,
            ),
          ),
          const Divider(
            height: 1,
          ),
          ...widget.options,
        ],
      ),
    );
  }
}
