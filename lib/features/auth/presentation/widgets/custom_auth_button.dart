import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? bgColor;
  const CustomAuthButton({super.key, required this.text, required this.onPressed, this.bgColor});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return FilledButton.tonal(
      
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        fixedSize: const Size(200, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side:  BorderSide(
            color: colors.surface
          ),
        ),
        backgroundColor: bgColor ?? colors.onSurface
      ), child: Text(text,
      style: TextStyle(color: colors.surface),),);
  }
}