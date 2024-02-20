class CircleInfo {
  final String circleId;
  final String circleName;

  CircleInfo({
    required this.circleId,
    required this.circleName,
  });
}

class TrackInfo {
  final String trackId;
  final String trackTitle;
  final String trackAudioUrl;
  final String albumId;
  final String albumTitle;
  final List<CircleInfo> artists;
  final String albumArtUrl;

  TrackInfo({
    required this.trackId,
    required this.trackTitle,
    required this.trackAudioUrl,
    required this.albumId,
    required this.albumTitle,
    required this.artists,
    required this.albumArtUrl,
  });
}
