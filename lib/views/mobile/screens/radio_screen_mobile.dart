import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';
import 'package:tlmc_player_app/services/impl/static_data_provider.dart';
import 'package:tlmc_player_app/views/common/widget/date_input.dart';
import 'package:choose_input_chips/choose_input_chips.dart';

class RadioScreenMobile extends StatefulWidget {
  RadioScreenMobile({super.key});

  DateTime? startRange;
  DateTime? endRange;
  GlobalKey originalAlbumsKey = GlobalKey();
  GlobalKey originalTracksKey = GlobalKey();
  GlobalKey circlesKey = GlobalKey();

  bool isKeyboardVisible = false;

  @override
  State<RadioScreenMobile> createState() => _RadioScreenMobileState();
}

class _RadioScreenMobileState extends State<RadioScreenMobile> {
  final _logging = Get.find<LoggingService>().getLogger("RadioScreenMobile");

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

  List<Widget> _buildRadioFilterInputs(
      BuildContext context, bool isKeyboardVisible) {
    final staticDataProvider = Get.find<StaticDataProvider>();

    return [
      ChipsInput<CircleReadDto>(
        key: widget.circlesKey,
        decoration: const InputDecoration(
          labelText: "Select Circles",
        ),
        initialValue: const [],
        chipBuilder: (context, state, value) {
          return InputChip(
            key: ObjectKey(value.name ?? ""),
            label: Text(value.name ?? ""),
            onDeleted: () => state.deleteChip(value),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          );
        },
        suggestionBuilder: (context, state, value) {
          return ListTile(
            key: ObjectKey(value.name ?? ""),
            title: Text(value.name ?? ""),
            onTap: () => state.selectSuggestion(value),
          );
        },
        findSuggestions: (String query) {
          return staticDataProvider.state?.circles
                  .where(
                      (e) => e.name?.isCaseInsensitiveContains(query) ?? false)
                  .toList() ??
              [];
        },
        onChanged: (data) {
          inputHeight = widget.circlesKey.currentContext?.size?.height ?? 0;
        },
      ),
      const SizedBox(height: 16),
      ChipsInput<OriginalAlbumReadDto>(
        key: widget.originalAlbumsKey,
        decoration: const InputDecoration(
          labelText: "Select Original Albums",
        ),
        initialValue: const [],
        chipBuilder: (context, state, value) {
          return InputChip(
            key: ObjectKey(value.shortName?.en ?? ""),
            label: Text(value.shortName?.en ?? ""),
            onDeleted: () => state.deleteChip(value),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          );
        },
        suggestionBuilder: (context, state, value) {
          return ListTile(
            key: ObjectKey(value.shortName?.en ?? ""),
            title: Text(value.shortName?.en ?? ""),
            onTap: () => state.selectSuggestion(value),
          );
        },
        findSuggestions: (String query) {
          return staticDataProvider.state?.originalAlbums
                  .where((e) =>
                      e.fullName?.en?.isCaseInsensitiveContains(query) ?? false)
                  .toList() ??
              [];
        },
        onChanged: (data) {
          inputHeight =
              widget.originalAlbumsKey.currentContext?.size?.height ?? 0;
        },
      ),
      const SizedBox(height: 16),
      ChipsInput<OriginalTrackReadDto>(
        key: widget.originalTracksKey,
        decoration: const InputDecoration(
          labelText: "Select Original Tracks",
        ),
        initialValue: const [],
        chipBuilder: (context, state, value) {
          return InputChip(
            key: ObjectKey(value.title?.en ?? ""),
            label: Text(value.title?.en ?? ""),
            onDeleted: () => state.deleteChip(value),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          );
        },
        suggestionBuilder: (context, state, value) {
          return ListTile(
            key: ObjectKey(value.title?.en ?? ""),
            title: Text(value.title?.en ?? ""),
            subtitle: Text(value.album?.shortName?.en ?? ""),
            onTap: () => state.selectSuggestion(value),
          );
        },
        findSuggestions: (String query) async {
          return staticDataProvider.state?.originalTracks
                  .where((e) =>
                      e.title?.en?.isCaseInsensitiveContains(query) ?? false)
                  .toList() ??
              [];
        },
        onChanged: (data) {
          inputHeight =
              widget.originalTracksKey.currentContext?.size?.height ?? 0;
        },
      ),
      if (isKeyboardVisible)
        SizedBox(
          height: inputHeight + keyboardHeight,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
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
                ..._buildRadioFilterInputs(context, isKeyboardVisible),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Apply Radio Filters"),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Clear Radio Filters"),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Start Radio"),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
