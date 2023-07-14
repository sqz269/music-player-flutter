import 'package:flutter/material.dart';

import 'package:tlmc_player_flutter/components/album_card.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double? calculatedHeight = 0.36 * MediaQuery.of(context).size.width - 4;

    return Center(
      child: Column(
        children: [
          AppBar(
            title: Text("ABcd"),
            toolbarHeight: 36,
            elevation: 0,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisExtent: calculatedHeight,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const AlbumCard(
                    imageUrl:
                        "https://api-music.marisad.me/api/asset/13b01f8c-4f97-400a-86b4-abd5b51a3920",
                    title: "Title Place Holder");
              },
            ),
          ),
        ],
      ),
    );
  }
}
