import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/static_data_provider.dart';
import 'package:tlmc_player_app/views/common/widget/date_input.dart';
import 'package:choose_input_chips/choose_input_chips.dart';

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
    final staticDataProvider = Get.find<StaticDataProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: SingleChildScrollView(
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
              ChipsInput<String>(
                decoration: InputDecoration(
                  labelText: "Select Original Tracks",
                ),
                initialValue: ["Test"],
                chipBuilder: (context, state, string) {
                  return InputChip(
                    key: ObjectKey(string),
                    label: Text(string),
                    onDeleted: () => state.deleteChip(string),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  );
                },
                suggestionBuilder: (context, state, str) {
                  return ListTile(
                    key: ObjectKey(str),
                    title: Text(str),
                    onTap: () => state.selectSuggestion(str),
                  );
                },
                findSuggestions: (String query) {
                  return staticDataProvider.state?.originalTracks
                          .map<String>((e) => e.title?.default_ ?? "")
                          .toList() ??
                      [];
                },
                onChanged: (data) {
                  print(data);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
