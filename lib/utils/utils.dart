import 'package:BackendClientApi/api.dart';

class Util {
  static timeStrNoHours(String timeString) {
    // remove the hours if it is 00
    // also remove milliseconds if it have it
    if (timeString.contains(".") && timeString.startsWith("00:")) {
      return timeString.substring(3, timeString.indexOf("."));
    } else if (timeString.startsWith("00:")) {
      return timeString.substring(3);
    } else {
      return timeString;
    }
  }

  static Duration timeStrToDuration(String timeString) {
    String hours = timeString.substring(0, 2);
    String minutes = timeString.substring(3, 5);
    String seconds = timeString.substring(6, 8);

    return Duration(
      hours: int.parse(hours),
      minutes: int.parse(minutes),
      seconds: int.parse(seconds),
    );
  }

  /// Sum a list of time strings as a total duration and return it as a string
  /// Accepts time string in the format of HH:MM:SS.mmmmmmm or HH:MM:SS
  /// However, the milliseconds will be ignored
  /// Returns a string in the format of HH:MM:SS
  static String sumTimeStr(List<String> timeStrings) {
    Duration totalDuration = Duration.zero;
    for (var timeString in timeStrings) {
      totalDuration += Duration(
        hours: int.parse(timeString.substring(0, 2)),
        minutes: int.parse(timeString.substring(3, 5)),
        seconds: int.parse(timeString.substring(6, 8)),
      );
    }

    return totalDuration.toString().substring(0, 7);
  }

  /// Convert time string in format of HH:MM:SS.mmmmmmm to human readable format
  /// For exmaple 00:03:45.000000 will be converted to 3 minutes 45 seconds
  static String timeStrToHuman(String timeString,
      {bool includeHours = true, bool includeSeconds = true}) {
    String hours = timeString.substring(0, 2);
    String minutes = timeString.substring(3, 5);
    String seconds = timeString.substring(6, 8);

    int minutesInt = int.parse(minutes);
    int hoursInt = int.parse(hours);
    int secondsInt = int.parse(seconds);

    if (includeHours) {
      if (includeSeconds) {
        return "$hoursInt hours $minutesInt minutes $secondsInt seconds";
      } else {
        return "$hoursInt hours $minutesInt minutes";
      }
    } else {
      if (includeSeconds) {
        return "$minutesInt minutes $secondsInt seconds";
      } else {
        return "$minutesInt minutes";
      }
    }
  }

  static String durationToHumanMmss(Duration duration) {
    var microseconds = duration.inMicroseconds;
    var sign = "";
    var negative = microseconds < 0;

    var hours = microseconds ~/ Duration.microsecondsPerHour;
    microseconds = microseconds.remainder(Duration.microsecondsPerHour);

    // Correcting for being negative after first division, instead of before,
    // to avoid negating min-int, -(2^31-1), of a native int64.
    if (negative) {
      hours = 0 - hours; // Not using `-hours` to avoid creating -0.0 on web.
      microseconds = 0 - microseconds;
      sign = "-";
    }

    var minutes = microseconds ~/ Duration.microsecondsPerMinute;
    microseconds = microseconds.remainder(Duration.microsecondsPerMinute);

    var minutesPadding = minutes < 10 ? "0" : "";

    var seconds = microseconds ~/ Duration.microsecondsPerSecond;
    microseconds = microseconds.remainder(Duration.microsecondsPerSecond);

    var secondsPadding = seconds < 10 ? "0" : "";

    return "$minutesPadding$minutes:$secondsPadding$seconds";
  }

  static List<String> getTrackDurationList(List<TrackReadDto> trackList) {
    List<String> trackDurationList = [];
    for (var track in trackList) {
      trackDurationList.add(track.duration!);
    }
    return trackDurationList;
  }
}
