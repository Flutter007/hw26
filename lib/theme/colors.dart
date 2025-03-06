import 'package:flutter/material.dart';

class CustomColor extends ThemeExtension<CustomColor> {
  final Color bottomNavBarSelectedColor;
  final Color cardTextColor;
  final Color cardBackgroundColor;
  final Color urgentIconColor;
  final Color backgroundOfChart;
  final Color greenShade;

  CustomColor(
      {required this.bottomNavBarSelectedColor,
      required this.cardTextColor,
      required this.cardBackgroundColor,
      required this.urgentIconColor,
      required this.backgroundOfChart,
      required this.greenShade});

  @override
  ThemeExtension<CustomColor> copyWith({
    Color? bottomNavBarSelectedColor,
    Color? cardTextColor,
    Color? cardBackgroundColor,
    Color? urgentIconColor,
    Color? backgroundOfChart,
    Color? greenShade,
  }) {
    return CustomColor(
      bottomNavBarSelectedColor:
          bottomNavBarSelectedColor ?? this.bottomNavBarSelectedColor,
      cardTextColor: cardTextColor ?? this.cardTextColor,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
      urgentIconColor: urgentIconColor ?? this.urgentIconColor,
      backgroundOfChart: backgroundOfChart ?? this.backgroundOfChart,
      greenShade: greenShade ?? this.greenShade,
    );
  }

  @override
  ThemeExtension<CustomColor> lerp(
      covariant ThemeExtension<CustomColor>? other, double t) {
    if (other is! CustomColor) return this;
    return CustomColor(
      bottomNavBarSelectedColor: Color.lerp(
          bottomNavBarSelectedColor, other.bottomNavBarSelectedColor, t)!,
      cardTextColor: Color.lerp(cardTextColor, other.cardTextColor, t)!,
      cardBackgroundColor:
          Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t)!,
      urgentIconColor: Color.lerp(urgentIconColor, other.urgentIconColor, t)!,
      backgroundOfChart:
          Color.lerp(backgroundOfChart, other.backgroundOfChart, t)!,
      greenShade: Color.lerp(greenShade, other.greenShade, t)!,
    );
  }
}
