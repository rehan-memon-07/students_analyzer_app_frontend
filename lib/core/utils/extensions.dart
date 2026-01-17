import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600;
  bool get isTablet => MediaQuery.of(this).size.width >= 600 && MediaQuery.of(this).size.width < 1024;
  
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension StringExt on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}

extension NumExt on num {
  String toScoreFormat() => toStringAsFixed(1);
}
