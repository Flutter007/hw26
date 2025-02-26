import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hw26/model/task_expense.dart';
import 'package:hw26/widget/statistics/statistic_card.dart';

class TasksChart extends StatelessWidget {
  final List<TaskExpense> expenses;
  const TasksChart({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    Widget getTitles(double value, TitleMeta meta) {
      String txt = value.toInt().toString();
      for (var expense in expenses) {
        if (expense.dateTime.day == value.toInt()) {
          txt = '${expense.dateTime.day}.${expense.dateTime.month}';
          break;
        }
      }

      return Text(
        txt,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    BarTouchTooltipData getToolLipData = BarTouchTooltipData(
      getTooltipColor: (group) => Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 8,
      getTooltipItem: (
        BarChartGroupData group,
        int groupIndex,
        BarChartRodData rod,
        int rodIndex,
      ) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      },
    );

    FlTitlesData titlesData = FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
    LinearGradient barsGradient = LinearGradient(
      colors: [
        Colors.blue.shade800,
        Colors.blue.shade300,
      ],
      begin: Alignment.centerRight,
      end: Alignment.bottomRight,
    );

    return StatisticCard(
      child: Container(
        height: 300,
        padding: EdgeInsets.symmetric(vertical: 14),
        margin: EdgeInsets.only(top: 10),
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(
              touchTooltipData: getToolLipData,
            ),
            barGroups: expenses
                .map(
                  (expense) => BarChartGroupData(
                    x: expense.dateTime.day,
                    showingTooltipIndicators: [0],
                    barRods: [
                      BarChartRodData(
                        gradient: barsGradient,
                        toY: (expense.counter ?? 0).toDouble(),
                        width: 12,
                      ),
                    ],
                  ),
                )
                .toList(),
            titlesData: titlesData,
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
            alignment: BarChartAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
