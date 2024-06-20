import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomAuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return FilledButton.tonal(
      
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        fixedSize: const Size(200, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: Colors.black
          ),
        ),
        backgroundColor: colors.onSurface
      ), child: Text(text,
      style: TextStyle(color: colors.surface),),);
  }
}