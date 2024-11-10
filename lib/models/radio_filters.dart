import 'package:backend_client_api/api.dart';

class RadioFilters {
  final DateTime? releaseDateBegin;
  final DateTime? releaseDateEnd;
  final List<CircleReadDto>? circles;
  final List<OriginalAlbumReadDto>? originalAlbums;
  final List<OriginalTrackReadDto>? originalTracks;

  RadioFilters({
    this.releaseDateBegin,
    this.releaseDateEnd,
    this.circles,
    this.originalAlbums,
    this.originalTracks,
  });
}
