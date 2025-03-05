import 'package:flutter/material.dart';
import 'package:hw26/theme/colors.dart';

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.dark,
);

final darkCustomColor = CustomColor(
  bottomNavBarSelectedColor: Colors.black,
  cardTextColor: Colors.black,
  cardBackgroundColor: Colors.white,
  urgentIconColor: Colors.red.shade900,
);

final darkTheme = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
    extensions: [darkCustomColor],
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: darkColorScheme.onSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkCustomColor.urgentIconColor,
        foregroundColor: darkCustomColor.cardTextColor,
      ),
    ),
    timePickerTheme: TimePickerThemeData().copyWith(
      backgroundColor: darkCustomColor.cardTextColor,
      confirmButtonStyle: ButtonStyle(
        foregroundColor:
            WidgetStatePropertyAll(darkCustomColor.cardBackgroundColor),
      ),
      cancelButtonStyle: ButtonStyle(
        foregroundColor:
            WidgetStatePropertyAll(darkCustomColor.cardBackgroundColor),
      ),
    ),
    datePickerTheme: DatePickerThemeData().copyWith(
      backgroundColor: darkCustomColor.cardTextColor,
      confirmButtonStyle: ButtonStyle(
        foregroundColor:
            WidgetStatePropertyAll(darkCustomColor.cardBackgroundColor),
      ),
      cancelButtonStyle: ButtonStyle(
        foregroundColor:
            WidgetStatePropertyAll(darkCustomColor.cardBackgroundColor),
      ),
    ));
