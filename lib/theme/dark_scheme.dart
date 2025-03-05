import 'package:flutter/material.dart';

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.dark,
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: darkColorScheme,
);
