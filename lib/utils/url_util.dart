import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  static Future<bool> openYoutubeSearch(String query) async {
    final String uri = 'youtube:///results?q=$query';
    var canLaunch = await canLaunchUrl(Uri.parse(uri));
    if (canLaunch) {
      await launchUrl(Uri.parse(uri));
      Get.snackbar('Success', 'Opened YouTube search');
    } else {
      Get.snackbar('Error', 'Failed to open YouTube search');
    }
    return canLaunch;
  }

  static Future<bool> openYoutubeSearchV2(String query) async {
    final String uri = 'https://www.youtube.com/results?search_query=$query';
    var canLaunch = await canLaunchUrl(Uri.parse(uri));
    if (canLaunch) {
      await launchUrl(Uri.parse(uri));
      Get.snackbar('Success', 'Opened YouTube search');
    } else {
      Get.snackbar('Error', 'Failed to open YouTube search');
    }
    return canLaunch;
  }

  static Future<bool> openYoutubeSearchV3(String query) async {
    final String uri = 'youtube://www.youtube.com/results?search_query=$query';
    var canLaunch = await canLaunchUrl(Uri.parse(uri));
    if (canLaunch) {
      await launchUrl(Uri.parse(uri));
      Get.snackbar('Success', 'Opened YouTube search');
    } else {
      Get.snackbar('Error', 'Failed to open YouTube search');
    }
    return canLaunch;
  }
}
