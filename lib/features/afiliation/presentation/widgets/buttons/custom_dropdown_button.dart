import 'package:flutter/material.dart';

class CustomDrowdownButton extends StatelessWidget {
  final bool initialSelection;
  final bool? enabled;
  final Color? borderColor;
  final Function(bool?)? onSelected;
  const CustomDrowdownButton({super.key, this.onSelected, required this.initialSelection, this.enabled, this.borderColor});

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
        label: const Text('¿Es medico?'),
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
