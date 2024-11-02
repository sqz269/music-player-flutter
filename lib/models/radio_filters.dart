class RadioFilters {
  final DateTime? releaseDateBegin;
  final DateTime? releaseDateEnd;
  final List<String>? circleIds;
  final List<String>? originalAlbumIds;
  final List<String>? originalTrackIds;

  RadioFilters({
    this.releaseDateBegin,
    this.releaseDateEnd,
    this.circleIds,
    this.originalAlbumIds,
    this.originalTrackIds,
  });
}
