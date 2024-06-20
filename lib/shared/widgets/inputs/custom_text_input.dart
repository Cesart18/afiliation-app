import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {

  final String hintText;
  final String? labelText;
  final String? errorMessage;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? enabled;
  final Color? borderColor;
  final int? maxLength;
  final bool obscureText;

  const CustomTextFormField({
      super.key,
      required this.hintText,
      this.labelText,
      this.errorMessage,
      this.suffixIcon,
      this.textAlign = TextAlign.start,
      this.onChanged,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.keyboardType,
      this.controller,
      this.enabled,
      this.borderColor,
      this.maxLength,
      this.obscureText = false
     });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}
class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w300,
            color: isHovered ? colors.primary : colors.onSurface
          );
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isHovered ? colors.primary : widget.borderColor ?? colors.onSurface,
        width: isHovered ? 2.0 : 1.5
      )
    );

    /// Used expanded because the textformfield needed
    return MouseRegion(
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
          labelStyle: textStyle,
          counterText: ''
        ),
        textAlign: widget.textAlign,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        cursorColor: colors.onSurface,
        cursorWidth: 1.5,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        enabled: widget.enabled,
        maxLength: widget.maxLength,
        obscureText: widget.obscureText,
          
      ),
    );
  }
}