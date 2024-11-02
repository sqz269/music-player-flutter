import 'package:flutter/material.dart';
import 'package:tlmc_player_app/views/mobile/screens/test.dart';

class RadioScreenMobile extends StatelessWidget {
  const RadioScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
      ),
      body: const EditableChipFieldExample(),
    );
  }
}
