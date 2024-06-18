import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatefulWidget {

  final int flex;
  final String hintText;
  final String? labelText;
  final String? errorMessage;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const CustomTextInput({
      super.key,
      required this.hintText,
      this.labelText,
      this.flex = 1,
      this.errorMessage,
      this.suffixIcon,
      this.textAlign = TextAlign.start,
      this.onChanged,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.keyboardType
     });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}
class _CustomTextInputState extends State<CustomTextInput> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w300,
            color: isHovered ? colors.primary : colors.surface
          );
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isHovered ? colors.primary : colors.onSurface,
        width: 1.5
      )
    );

    /// Used expanded because the textformfield needed
    return Expanded(
      flex: widget.flex,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isHovered = true;
        }),
        onExit: (event) => setState(() {
          isHovered = false;
        }),
        child: TextFormField(
          /// decoration
          decoration: InputDecoration(
            border: border,
            errorBorder: border,
            enabledBorder: border,
            // focusedBorder: border,
            disabledBorder: border,
            focusedErrorBorder: border,
            labelText: widget.labelText,
            hintText: widget.hintText,
            errorText: widget.errorMessage,
            suffixIcon: widget.suffixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hoverColor: colors.primary,
            hintStyle: textStyle,
            labelStyle: textStyle
          ),
          textAlign: widget.textAlign,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          cursorColor: colors.onSurface,
          cursorWidth: 1.5,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,

        ),
      )
      );
  }
}