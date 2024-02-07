class TrackInfo {
  final String trackId;
  final String trackTitle;
  final String trackAudioUrl;
  final String albumTitle;
  final List<String> artists;
  final String albumArtUrl;

  TrackInfo({
    required this.trackId,
    required this.trackTitle,
    required this.trackAudioUrl,
    required this.albumTitle,
    required this.artists,
    required this.albumArtUrl,
  });
}
