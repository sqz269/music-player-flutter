import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:tlmc_player_app/services/impl/options_builder/i_track_option.dart';

class TrackBottomSheetOptionsList extends StatelessWidget {
  final TrackOptions options;
  final AlbumReadDto albumData;
  final TrackReadDto trackData;

  const TrackBottomSheetOptionsList(
      this.options, this.trackData, this.albumData,
      {super.key});

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
                albumData.thumbnail!.medium!.url!,
                fit: BoxFit.cover,
                width: 32,
                height: 32,
              ),
              title: RichText(
                text: TextSpan(
                  text: albumData.name!.default_,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: '\n${albumData.albumArtist![0].name}',
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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var option = options.options[index];
              return ListTile(
                leading: option.icon,
                title: Text(option.title),
                onTap: () {
                  option.execute();
                  Navigator.of(context).pop();
                },
              );
            },
            itemCount: options.options.length,
          ),
        ],
      ),
    );
  }

  static TrackBottomSheetOptionsList fromOptions(
      TrackOptions options, TrackReadDto trackData, AlbumReadDto albumData) {
    return TrackBottomSheetOptionsList(options, trackData, albumData);
  }
}
