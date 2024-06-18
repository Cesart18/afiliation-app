import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Function()? onPressed;
  const PrimaryButton({super.key, required this.text, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: IntrinsicWidth(
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
          onPressed: onPressed, child: Text(text)),
      ));
  }
}