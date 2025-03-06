import 'package:flutter/material.dart';
import 'package:hw26/theme/colors.dart';

class StatisticCard extends StatelessWidget {
  final Widget child;
  const StatisticCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: customColor.backgroundOfChart,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: child,
        ),
      ),
    );
  }
}
