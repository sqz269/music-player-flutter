import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tlmc_player_app/controllers/desktop/screens/album_screen_desktop_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';

class AlbumScreenDesktop extends StatelessWidget {
  final String albumId;
  final AlbumScreenDesktopController controller;

  AlbumScreenDesktop({super.key, required this.albumId})
      : controller = Get.getOrPut(
            AlbumScreenDesktopController(albumId: albumId),
            tag: albumId);

  Widget _buildAlbumImage(
      AlbumScreenDesktopState? states, BuildContext context) {
    if (states == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return states.masterAlbum.thumbnail == null
        ? LayoutBuilder(
            builder: (context, constraint) => Icon(
              Icons.album,
              size: constraint.biggest.height * 0.9,
              color: Colors.grey.shade300,
            ),
          )
        : Image.network(
            states.masterAlbum.thumbnail!.original!.url!,
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
          );
  }

  Widget _buildAlbumInfoView(
      AlbumScreenDesktopState? states, BuildContext context) {
    if (states == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // compute the size of the album cover, ideally, we want to take up 1/3 of the screen width
    var coverSize = MediaQuery.of(context).size.width / 7;

    return SliverToBoxAdapter(
      child: Row(
        children: [
          SizedBox(
            width: coverSize,
            height: coverSize,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _buildAlbumImage(states, context),
            ),
          ),
          Container(
            height: coverSize,
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  states.masterAlbum.albumName!.default_,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  states.masterAlbum.albumName!.default_,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                // RichText(
                //   text: TextSpan(
                //     children: [
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Size calculateTextSize(String text, TextStyle style,
      {double maxWidth = double.infinity}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  Size getMaxTextWidth(List<String> texts, TextStyle style) {
    double maxWidth = 0;
    for (var text in texts) {
      var size = calculateTextSize(text, style);
      if (size.width > maxWidth) {
        maxWidth = size.width;
      }
    }
    return Size(maxWidth, style.fontSize!);
  }

  Widget _buildTrackOriginal(AlbumScreenDesktopState states,
      BuildContext context, TrackReadDto track) {
    List<Widget> orgAlbumWidgets = [];

    if (track.original != null) {
      for (var org in track.original!) {
        orgAlbumWidgets.add(
          ActionChip(
            visualDensity: VisualDensity.compact,
            label: Text(org.title!.en!),
            onPressed: () {},
            backgroundColor: Colors.transparent,
          ),
        );
      }
    }

    return Row(
      children: orgAlbumWidgets,
    );
  }

  Widget _buildSingleAlbumTracksView(
      AlbumScreenDesktopState states, BuildContext context) {
    // double _kTrackTitleWidth = getMaxTextWidth(
    //   ["Title"],
    //   TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    // ).width;

    double _kTrackTitleWidth = MediaQuery.of(context).size.width * 0.2;

    return SliverToBoxAdapter(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          TrackReadDto track = states.masterAlbum.tracks![index];

          return ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/debug/audio/${track.id}');
              Get.find<QueueService>().addTrackById(track.id!);
            },
            hoverColor: Theme.of(context).colorScheme.secondary,
            leading: Text((index + 1).toString()),
            title: Row(
              children: [
                SizedBox(
                  width: _kTrackTitleWidth,
                  child: Text(
                    track.name!.default_,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                _buildTrackOriginal(states, context, track),
              ],
            ),
            trailing: Text(states.masterAlbum.tracks![index].duration!),
          );
        },
        itemCount: states.masterAlbum.tracks!.length,
      ),
    );
  }

  Widget _buildMultiAlbumTracksView(
      AlbumScreenDesktopState states, BuildContext context) {
    return Placeholder();
  }

  Widget _buildTracksView(
      AlbumScreenDesktopState states, BuildContext context) {
    if (states.masterAlbum.numberOfDiscs == 1) {
      return _buildSingleAlbumTracksView(states, context);
    }
    {
      return _buildMultiAlbumTracksView(states, context);
    }
  }

  Widget _buildSingleAlbumTrackViewTable(
      AlbumScreenDesktopState states, BuildContext context) {
    return SliverToBoxAdapter(
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(0.3),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(3),
          4: FlexColumnWidth(1),
        },
        children: [
          const TableRow(
            children: [
              TableCell(
                child: Text(
                  "No.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TableCell(
                child: Text(
                  "Title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TableCell(
                child: Text(
                  "Original",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TableCell(
                child: Text(
                  "Duration",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          for (var track in states.masterAlbum.tracks!)
            TableRow(
              children: [
                TableCell(
                  child: Text((states.masterAlbum.tracks!.indexOf(track) + 1)
                      .toString()),
                ),
                TableCell(
                  child: Text(
                    track.name!.default_,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                TableCell(
                  child: _buildTrackOriginal(states, context, track),
                ),
                TableCell(
                  child: Text(track.duration!),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildTracksViewTable(
      AlbumScreenDesktopState states, BuildContext context) {
    if (states.masterAlbum.numberOfDiscs == 1) {
      return _buildSingleAlbumTracksView(states, context);
    }
    {
      return _buildMultiAlbumTracksView(states, context);
    }
  }

  Widget _buildMainView(AlbumScreenDesktopState? states, BuildContext context) {
    if (states == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(states.masterAlbum.albumName!.default_),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: CustomScrollView(
          slivers: [
            _buildAlbumInfoView(states, context),
            _buildTracksView(states, context),
            // _buildSingleAlbumTrackViewTable(states, context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      onLoading: Scaffold(
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      (state) => _buildMainView(state, context),
    );
  }
}
