import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.onTapped,
    this.fillColor,
    this.size = 36,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final Future<void> Function() onTapped;
  final double size;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTapped,
      elevation: 0,
      fillColor: fillColor,
      constraints: BoxConstraints.expand(width: size, height: size),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: CircleBorder(
        side: BorderSide(
          color: iconColor,
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
