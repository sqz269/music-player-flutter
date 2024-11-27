import 'package:flutter/material.dart';
import 'package:tlmc_player_app/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  static Future<bool> openYoutubeSearch(
      ScaffoldMessengerState messenger, String query) async {
    final String uri = 'https://www.youtube.com/results?search_query=$query';
    var canLaunch = await canLaunchUrl(Uri.parse(uri));
    if (canLaunch) {
      await launchUrl(Uri.parse(uri), mode: LaunchMode.externalApplication);
      Utils.showSnackBar(messenger, 'Opened YouTube search');
    } else {
      Utils.showSnackBar(messenger, 'Failed to open YouTube search');
    }
    return canLaunch;
  }
}
