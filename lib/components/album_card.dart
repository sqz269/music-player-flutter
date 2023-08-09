import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'outlined_card.dart';

class AlbumCard extends StatelessWidget {
  final AlbumReadDto albumData;

  const AlbumCard({Key? key, required this.albumData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/album',
          arguments: {
            'albumId': albumData.id,
          },
        );
      },
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
                          child: Image.network(
                            albumData.thumbnail!.large!.url!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      albumData.albumName!.default_,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
