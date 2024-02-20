extension DateTimeExtension on DateTime {
  // TODO: Account for different locales
  String toHumanReadableDate() {
    return "${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year";
  }
}
