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
  Future<DateTime?> _showDatePicker(
      BuildContext context, DateTime? initialDate) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1970, 1, 1),
      lastDate: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            DateInput(
              controller: TextEditingController(),
              label: 'Start Range',
              initialDate: widget.startRange,
              firstDate: DateTime(1970, 1, 1),
              lastDate: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}
