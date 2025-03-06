import 'package:flutter/material.dart';
import 'package:hw26/theme/colors.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue.shade400,
);
final lightCustomColors = CustomColor(
  bottomNavBarSelectedColor: Colors.white,
  cardTextColor: Colors.white,
  cardBackgroundColor: Colors.blueGrey.shade400,
  urgentIconColor: Colors.red.shade500,
  backgroundOfChart: Colors.blue.shade300,
  greenShade: Colors.green.shade300,
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
  ),
  dropdownMenuTheme: DropdownMenuThemeData().copyWith(
    textStyle: TextStyle(color: lightCustomColors.cardBackgroundColor),
    menuStyle: MenuStyle(
      side: WidgetStatePropertyAll(
        BorderSide(
          color: lightCustomColors.cardBackgroundColor,
        ),
      ),
    ),
  ),
);
