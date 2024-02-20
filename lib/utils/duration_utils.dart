import 'package:tlmc_player_app/extensions/duration_extension.dart';

class DurationUtils {
  static String formatDuration(Duration? duration) {
    if (duration == null) {
      return '--:--';
    }

    return duration.toHumanReadableDuration();
  }

  static Duration parseDuration(String? duration) {
    if (duration == null) {
      return Duration.zero;
    }

    // Strip out miliseconds
    duration = duration.split('.').first;

    final parts = duration.split(':');
    if (parts.length == 3) {
      return Duration(
        hours: int.parse(parts[0]),
        minutes: int.parse(parts[1]),
        seconds: int.parse(parts[2]),
      );
    } else if (parts.length == 2) {
      return Duration(
        minutes: int.parse(parts[0]),
        seconds: int.parse(parts[1]),
      );
    } else {
      return Duration.zero;
    }
  }
}
