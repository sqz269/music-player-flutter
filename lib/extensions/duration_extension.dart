extension DurationExtension on Duration {
  String toHumanReadableDuration() {
    // Convert the duration to MM:SS format if the duration is less than 1 hour
    // Other wise, use HH:MM:SS format
    if (inHours == 0) {
      return '${inMinutes.remainder(60).toString().padLeft(2, '0')}:${inSeconds.remainder(60).toString().padLeft(2, '0')}';
    } else {
      return '${inHours.toString().padLeft(2, '0')}:${inMinutes.remainder(60).toString().padLeft(2, '0')}:${inSeconds.remainder(60).toString().padLeft(2, '0')}';
    }
  }
}
