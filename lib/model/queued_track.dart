import 'package:uuid/uuid.dart';
import 'package:BackendClientApi/api.dart';

enum AddedBy {
  user,
  radio,
}

class QueuedTrack {
  static const Uuid _uuid = Uuid();

  final String id;
  final TrackReadDto track;
  final String? playlistId;
  final AddedBy addedBy;
  int index;

  QueuedTrack({
    required this.track,
    required this.index,
    this.playlistId,
    this.addedBy = AddedBy.user,
    id,
  }) : id = id ?? _uuid.v4() {
    if (index < 0) {
      throw Exception("Index cannot be less than 0");
    }
  }
}
