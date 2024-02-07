import 'package:tlmc_player_app/extensions/duration_extension.dart';

class DurationUtils {
  static String formatDuration(Duration? duration) {
    if (duration == null) {
      return '--:--';
    }

    return duration.toHumanReadableDuration();
  }
}
