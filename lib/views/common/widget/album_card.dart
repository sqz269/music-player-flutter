import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tlmc_player_app/views/common/widget/outlined_card.dart';

class AlbumCard extends StatelessWidget {
  final AlbumReadDto albumData;

  const AlbumCard({Key? key, required this.albumData}) : super(key: key);

  Widget _buildAlbumThumbnail(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: albumData.thumbnail == null
            ? LayoutBuilder(
                builder: (context, constraint) => Icon(
                  Icons.album,
                  size: constraint.biggest.height * 0.9,
                  color: Colors.grey.shade300,
                ),
              )
            : Image.network(
                albumData.thumbnail!.medium!.url!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : SizedBox.expand(
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                        );
                },
              ),
      ),
    );
  }

  List<Widget> _buildAlbumText(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            albumData.name!.default_,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            maxLines: 2,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: albumData.albumArtist![0].name,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey.shade600),
              ),
            ],
          ),
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/album/${albumData.id}");
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAlbumThumbnail(context),
              ..._buildAlbumText(context),
            ],
          ),
        ),
      ),
    );
  }
}
