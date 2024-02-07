import 'package:BackendClientApi/api.dart';
import 'package:uuid/uuid.dart';

class QueuedTrack {
  static const _uuid = Uuid();

  final String queueItemId;
  final String groupTag;
  final TrackReadDto track;
  int index;

  QueuedTrack({
    required this.track,
    required this.index,
    this.groupTag = "default",
    id,
  }) : queueItemId = id ?? _uuid.v4() {
    if (index < 0) {
      throw Exception("Index cannot be less than 0");
    }
  }
}
