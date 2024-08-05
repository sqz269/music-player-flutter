import 'package:backend_client_api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tlmc_player_app/controllers/desktop/screens/album_screen_desktop_controller.dart';
import 'package:tlmc_player_app/extensions/duration_extension.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/extensions/datetime_extension.dart';

import 'package:tlmc_player_app/utils/duration_utils.dart';
import 'package:tlmc_player_app/views/common/widget/group_box.dart';

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

  Widget _buildAlbumMiscInfoRow(
      AlbumScreenDesktopState states, BuildContext context) {
    var infoWidgets = <Widget>[];

    // ARTIST INFO
    var artistTextWidgets = <TextSpan>[];
    for (var artist in states.masterAlbum.albumArtist!) {
      artistTextWidgets.add(
        TextSpan(
          text: artist.name!,
          style: Theme.of(context).textTheme.titleMedium,
          recognizer: TapGestureRecognizer()
            ..onTap = () => Navigator.of(context).pushNamed(
                  '/circle/${artist.id}',
                ),
        ),
      );
    }
    infoWidgets.add(
      RichText(
        text: TextSpan(
          children: artistTextWidgets,
        ),
      ),
    );

    // RELEASE DATE
    if (states.masterAlbum.releaseDate != null) {
      infoWidgets.add(
        Text(
          states.masterAlbum.releaseDate!.toHumanReadableDate(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    // Total Tracks Count
    var trackText = states.tracks.length == 1 ? "Track" : "Tracks";
    infoWidgets.add(
      Text(
        "${states.tracks.length} $trackText",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );

    // Total Duration
    // calc total duration
    String totalDuration;
    try {
      totalDuration = (states.tracks
          .map(
            (e) => DurationUtils.parseDuration(e.duration!),
          )
          .toList()
          .reduce(
            (value, element) => value + element,
          )).toHumanReadableDuration();
    } catch (e) {
      totalDuration = "N/A";
    }

    infoWidgets.add(
      Text(
        totalDuration,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );

    for (var index = infoWidgets.length - 1; index != 0; index--) {
      infoWidgets.insert(
        index,
        const VerticalDivider(
          width: 20,
          thickness: 1,
        ),
      );
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IntrinsicHeight(
            child: Row(children: infoWidgets),
          ),
        ],
      ),
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
    var coverSize =
        clampDouble(MediaQuery.of(context).size.width / 7, 175, 250);

    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 16.0),
      sliver: SliverToBoxAdapter(
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
            Expanded(
              child: Container(
                height: coverSize,
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Album",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            states.masterAlbum.name!.default_,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                    ),
                    _buildAlbumMiscInfoRow(states, context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlbumControlView(
      AlbumScreenDesktopState states, BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          children: [
            IconButton.filled(
              iconSize: 42,
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
            ),
            const SizedBox(
              width: 16,
            ),
            IconButton(
              iconSize: 42,
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ],
        ),
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
    double kTrackTitleWidth = MediaQuery.of(context).size.width * 0.2;

    return SliverToBoxAdapter(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          TrackReadDto track = states.masterAlbum.tracks![index];

          return ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/debug/audio/${track.id}');
              Get.find<QueueService>()
                  .addTrackById(track.id!, playImmediately: true);
            },
            hoverColor: Theme.of(context).colorScheme.secondary,
            leading: Text((index + 1).toString()),
            title: Row(
              children: [
                SizedBox(
                  width: kTrackTitleWidth,
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
    double kTrackTitleWidth = MediaQuery.of(context).size.width * 0.2;

    var discTrackLists = <Widget>[];

    constructDiscTrackList(AlbumReadDto disc) {
      String groupBoxTitle;
      if (disc.discName != null) {
        groupBoxTitle = disc.discName!;
      } else {
        groupBoxTitle = "Disc ${disc.discNumber}";
      }

      var body = ListView.builder(
        itemBuilder: (context, index) {
          TrackReadDto track = disc.tracks![index];

          return ListTile(
            onTap: () {
              Get.find<QueueService>()
                  .addTrackById(track.id!, playImmediately: true);
            },
            hoverColor: Theme.of(context).colorScheme.secondary,
            leading: Text((index + 1).toString()),
            title: Row(
              children: [
                SizedBox(
                  width: kTrackTitleWidth,
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
            trailing: Text(disc.tracks![index].duration!),
          );
        },
        itemCount: disc.tracks!.length,
        shrinkWrap: true,
      );

      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: GroupBox(
          title: groupBoxTitle,
          child: disc.tracks!.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      "No tracks found",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                )
              : body,
        ),
      );
    }

    for (var disc in states.albums) {
      discTrackLists.add(constructDiscTrackList(disc));
    }

    return SliverToBoxAdapter(
      child: Column(
        children: discTrackLists,
      ),
    );
  }

  Widget _buildTracksView(
      AlbumScreenDesktopState states, BuildContext context) {
    if (states.masterAlbum.numberOfDiscs == 1) {
      return _buildSingleAlbumTracksView(states, context);
    } else {
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
    } else {
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Text(states.masterAlbum.name!.default_),
          ),
          _buildAlbumInfoView(states, context),
          _buildAlbumControlView(states, context),
          _buildTracksView(states, context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      onLoading: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      (state) => _buildMainView(state, context),
    );
  }
}
