import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final InputDecoration? decoration;

  const DateInput({
    super.key,
    required this.controller,
    required this.label,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.decoration,
  });

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1970, 1, 1),
      lastDate: lastDate ?? DateTime.now(),
    );
  }

  Future<void> _showDatePickerAndSubmit(BuildContext context) async {
    final date = await _showDatePicker(context);
    if (date != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      decoration: decoration?.copyWith(label: Text(label)) ??
          InputDecoration(
            label: Text(label),
          ),
      onTap: () => _showDatePickerAndSubmit(context),
    );
  }
}
