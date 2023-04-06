import 'package:flutter/material.dart';
import 'package:pos_van/constants/decorations/colors.dart';

class BorderedTextField extends StatelessWidget {
  const BorderedTextField({
    Key? key,
    this.controller,
    required this.onEditingEnd,
  }) : super(key: key);

  final TextEditingController? controller;
  final Future<void> Function() onEditingEnd;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (bool isFocus) async {
        if (isFocus) {
          return;
        }
        await onEditingEnd();
      },
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 2,
              color: kPrimaryLightColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 2,
              color: kPrimaryDarkColor,
            ),
          ),
        ),
      ),
    );
  }
}
