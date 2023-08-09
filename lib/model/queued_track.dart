import 'package:uuid/uuid.dart';
import 'package:BackendClientApi/api.dart';

class QueuedTrack {
  static Uuid _uuid = Uuid();

  final String id;
  final TrackReadDto track;
  final String? playlistId;
  int index;

  QueuedTrack({
    required this.track,
    required this.index,
    this.playlistId,
    id,
  }) : this.id = id ?? _uuid.v4() {
    if (index < 0) {
      throw Exception("Index cannot be less than 0");
    }
  }
}
