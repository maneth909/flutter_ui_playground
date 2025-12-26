import 'package:flutter/material.dart';

// This allows you to use "context.primaryBlue" anywhere in your app
extension BankingTheme on BuildContext {
  Color get primaryBlue => Theme.of(this).colorScheme.primary;
  Color get backgroundGrey => Theme.of(this).scaffoldBackgroundColor;
  Color get textColor => Theme.of(this).colorScheme.onSurface;
  Color get greyTextColor => Theme.of(this).colorScheme.onSurfaceVariant;
}
