
import 'package:flutter/material.dart';

// Your student details
const String studentName = 'Sam C. Yangao';
const String studentId = '241-01803';

// Theme colors based on the last two digits of your student ID.
const List<String> _colorNames = [
  'Red',
  'Pink',
  'Purple',
  'Deep Purple',
  'Indigo',
  'Blue',
  'Light Blue',
  'Cyan',
  'Teal',
  'Green',
  'Light Green',
  'Lime',
  'Yellow',
  'Amber',
  'Orange',
  'Deep Orange',
  'Brown',
  'Blue Grey',
];

int get _colorIndex {
  final String digits = studentId.replaceAll(
    RegExp(r'[^0-9]'),
    '',
  );
  final int lastTwo = int.parse(
    digits.substring(digits.length - 2),
  );
  return lastTwo % Colors.primaries.length;
}

Color get studentColor => Colors.primaries[_colorIndex];

String get studentColorName => _colorNames[_colorIndex];