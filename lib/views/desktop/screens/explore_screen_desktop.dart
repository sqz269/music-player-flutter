import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/radio_service.dart';

class ExploreScreenDesktop extends StatelessWidget {
  const ExploreScreenDesktop({super.key});

  Widget _buildExploreRow(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.radio),
            title: const Text("Radio"),
            onTap: () {
              Get.find<RadioService>().active.toggle();
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Artists"),
            onTap: () {
              Navigator.of(context).pushNamed("/albums");
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.music_note),
            title: const Text("Original Tracks"),
            onTap: () {
              Navigator.of(context).pushNamed("/albums");
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
      ),
      body: _buildExploreRow(context),
    );
  }
}
