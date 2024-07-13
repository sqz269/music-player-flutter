import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tlmc_player_app/views/common/widget/outlined_card.dart';

class AlbumCard extends StatelessWidget {
  final AlbumReadDto albumData;

  const AlbumCard({Key? key, required this.albumData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          "/album/${albumData.id}",
        );
      },
      onLongPress: () {},
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: OutlinedCard(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AspectRatio(
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
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: Container(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                    },
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        albumData.name!.default_,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
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
                            text: "Album",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey.shade600),
                          ),
                          TextSpan(
                            text: ' · ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey.shade600),
                          ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
