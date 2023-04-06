import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    Key? key,
    required this.icon,
    required this.colorTheme,
    required this.onTapped,
  }) : super(key: key);

  final IconData icon;
  final Color colorTheme;
  final Future<void> Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTapped,
      elevation: 0,
      constraints: const BoxConstraints.expand(width: 36, height: 36),
      shape: CircleBorder(
        side: BorderSide(
          color: colorTheme,
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        color: colorTheme,
      ),
    );
  }
}
