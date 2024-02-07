import 'package:async/async.dart';

class StreamUtils {
  static Stream<T> merge<T>(List<Stream<T>> streams) {
    return StreamGroup.merge<T>(streams);
  }
}
