import 'package:flutter/material.dart';

class CustomDrowdownButton extends StatelessWidget {
  final bool initialSelection;
  final bool? enabled;
  final Color? borderColor;
  final String label;
  final Function(bool?)? onSelected;
  const CustomDrowdownButton({
    super.key,
    required this.initialSelection,
    required this.label,
    this.onSelected,
    this.enabled, this.borderColor,
    });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(width: 1.5,color: borderColor ?? colors.onSurface));

    return  DropdownMenu(
        inputDecorationTheme: InputDecorationTheme(
          border: border,
          errorBorder: border,
          enabledBorder: border,
          focusedBorder: border,
          disabledBorder: border),
        label: Text(label),
        initialSelection: initialSelection,
        enableSearch: false,
        onSelected: onSelected,
        enabled: enabled ?? true,
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: true, label: 'Si'),
          DropdownMenuEntry(value: false, label: 'No'),
        ]);
  }
}
