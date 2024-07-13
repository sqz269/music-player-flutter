import 'package:backend_client_api/api.dart';
import 'package:uuid/uuid.dart';

class QueuedTrack {
  static const _uuid = Uuid();

  final String queueItemId;
  final String groupTag;
  final TrackReadDto track;

  QueuedTrack({
    required this.track,
    this.groupTag = "default",
    id,
  }) : queueItemId = id ?? _uuid.v4();
}
