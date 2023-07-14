import 'package:uuid/uuid.dart';
import 'package:BackendClientApi/api.dart';

class QueuedTrack {
  final Uuid id;
  final TrackReadDto track;
  final String? playlistId;
  int index;

  QueuedTrack({
    required this.track,
    this.index = -1,
    this.id = const Uuid(),
    this.playlistId,
  });
}
