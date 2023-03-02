import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputTextCustom extends StatelessWidget {
  const InputTextCustom({
    super.key,
    required this.label,
    required this.textdata,
    required this.name,
    required this.enabled,
  });

  final String label;
  final String name;
  final String? textdata;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      enabled: enabled,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Không được để trống';
        }
        if (int.tryParse(value) == null &&
            (name == 'decentralization' || name == 'status')) {
          return 'Không được nhập kí tự nào khác ngoài số';
        }
        return null;
      },
      name: name,
      initialValue: textdata,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
      ),
    );
  }
}
