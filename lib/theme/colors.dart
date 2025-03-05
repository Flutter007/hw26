import 'package:flutter/material.dart';

class CustomColor extends ThemeExtension<CustomColor> {
  final Color bottomNavBarSelectedColor;
  final Color cardTextColor;
  final Color cardBackgroundColor;
  final Color urgentIconColor;

  CustomColor({
    required this.bottomNavBarSelectedColor,
    required this.cardTextColor,
    required this.cardBackgroundColor,
    required this.urgentIconColor,
  });

  @override
  ThemeExtension<CustomColor> copyWith({
    Color? bottomNavBarSelectedColor,
    Color? cardTextColor,
    Color? cardBackgroundColor,
    Color? urgentIconColor,
  }) {
    return CustomColor(
      bottomNavBarSelectedColor:
          bottomNavBarSelectedColor ?? this.bottomNavBarSelectedColor,
      cardTextColor: cardTextColor ?? this.cardTextColor,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
      urgentIconColor: urgentIconColor ?? this.urgentIconColor,
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
    );
  }
}
