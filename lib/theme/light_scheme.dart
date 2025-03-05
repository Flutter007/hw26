import 'package:flutter/material.dart';
import 'package:hw26/theme/colors.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue.shade400,
);
final lightCustomColors = CustomColor(
  bottomNavBarSelectedColor: Colors.white,
  cardTextColor: Colors.indigo.shade900,
  cardBackgroundColor: Colors.blue.shade200,
  urgentIconColor: Colors.red.shade500,
);
final lightTheme = ThemeData.light().copyWith(
    colorScheme: lightColorScheme,
    extensions: [lightCustomColors],
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: lightColorScheme.primaryContainer,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.onSecondary,
      ),
    ),
    datePickerTheme: DatePickerThemeData().copyWith(
      backgroundColor: lightColorScheme.primaryContainer,
    ),
    timePickerTheme: TimePickerThemeData().copyWith(
      backgroundColor: lightColorScheme.primaryContainer,
    ));
