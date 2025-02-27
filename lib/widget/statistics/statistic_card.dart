import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  final Widget child;
  const StatisticCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.blueGrey.shade300,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: child,
        ),
      ),
    );
  }
}
