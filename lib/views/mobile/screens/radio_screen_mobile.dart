import 'package:flutter/material.dart';
import 'package:tlmc_player_app/views/common/widget/date_input.dart';
import 'package:tlmc_player_app/views/mobile/screens/test.dart';

class RadioScreenMobile extends StatefulWidget {
  RadioScreenMobile({super.key});

  DateTime? startRange;
  DateTime? endRange;

  @override
  State<RadioScreenMobile> createState() => _RadioScreenMobileState();
}

class _RadioScreenMobileState extends State<RadioScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            DateInput(
              controller: TextEditingController(),
              label: 'Release Date (After)',
              initialDate: widget.startRange,
              firstDate: DateTime(1970, 1, 1),
              lastDate: DateTime.now(),
            ),
            const SizedBox(height: 16),
            DateInput(
              controller: TextEditingController(),
              label: 'Release Date (Before)',
              initialDate: widget.endRange,
              firstDate: DateTime(1970, 1, 1),
              lastDate: DateTime.now(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
