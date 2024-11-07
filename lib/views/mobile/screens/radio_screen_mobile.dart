import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/static_data_provider.dart';
import 'package:tlmc_player_app/views/common/widget/date_input.dart';
import 'package:choose_input_chips/choose_input_chips.dart';

class RadioScreenMobile extends StatefulWidget {
  RadioScreenMobile({super.key});

  DateTime? startRange;
  DateTime? endRange;
  GlobalKey inputKey = GlobalKey();

  @override
  State<RadioScreenMobile> createState() => _RadioScreenMobileState();
}

class _RadioScreenMobileState extends State<RadioScreenMobile> {
  var inputHeight = 0.0;
  var keyboardHeight = 0.0;
  @override
  void initState() {
    super.initState();
    // Subscribe to keyboard visibility changes
    KeyboardVisibilityController().onChange.listen((bool visible) {
      if (visible) {
        setState(() {
          keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        });
      } else {
        setState(() {
          keyboardHeight = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final staticDataProvider = Get.find<StaticDataProvider>();

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Radio'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
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
                  key: widget.inputKey,
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
                    inputHeight =
                        widget.inputKey.currentContext?.size?.height ?? 0;
                    print(inputHeight);
                    print(keyboardHeight);
                  },
                ),
                if (isKeyboardVisible)
                  SizedBox(
                    height: inputHeight + keyboardHeight,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
