import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
}
