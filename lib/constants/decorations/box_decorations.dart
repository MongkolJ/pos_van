import 'package:flutter/material.dart';
import 'colors.dart';

BoxDecoration kCardDecoration = BoxDecoration(
  color: kCardBackgroundColor,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(
      color: Colors.grey[300]!,
      blurRadius: 8,
      spreadRadius: 2,
      offset: const Offset(0, 3),
    ),
  ],
);
