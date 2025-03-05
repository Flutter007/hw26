import 'package:hw26/hw26.dart';
import 'package:flutter/material.dart';
import 'package:hw26/theme/dark_scheme.dart';
import 'package:hw26/theme/light_scheme.dart';

void main() {
  runApp(MaterialApp(
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: ThemeMode.system,
    home: Hw26(),
  ));
}
