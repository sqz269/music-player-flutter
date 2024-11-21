import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:tlmc_player_app/views/mobile/widgets/bottom_sheet/track/i_track_bottom_sheet_options.dart';

class TrackBottomSheetBuilder {
  final AlbumReadDto albumData;
  final TrackReadDto trackData;

  final List<ITrackBottomSheetOption> _options = [];

  TrackBottomSheetBuilder({required this.trackData, required this.albumData});

  TrackBottomSheetBuilder addOption(ITrackBottomSheetOption? option) {
    if (option == null) {
      return this;
    }
    _options.add(option);
    return this;
  }

  TrackBottomSheetBuilder withCallBack(VoidCallback callback) {
    _options.last.addCallback(callback);
    return this;
  }

  TrackBottomSheet build() {
    return TrackBottomSheet(
      albumData: albumData,
      trackData: trackData,
      options: _options,
    );
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => build(),
    );
  }
}

class TrackBottomSheet extends StatefulWidget {
  final AlbumReadDto albumData;
  final TrackReadDto trackData;
  final List<ITrackBottomSheetOption> options;

  const TrackBottomSheet({
    super.key,
    required this.trackData,
    required this.albumData,
    required this.options,
  });

  @override
  State<TrackBottomSheet> createState() => _TrackBottomSheetState();
}

class _TrackBottomSheetState extends State<TrackBottomSheet> {
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
                widget.albumData.thumbnail!.medium!.url!,
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
              title: RichText(
                text: TextSpan(
                  text: widget.trackData.name!.default_,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: '\n${widget.albumData.albumArtist![0].name}',
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
