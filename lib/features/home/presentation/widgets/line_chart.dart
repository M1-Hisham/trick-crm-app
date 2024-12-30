import 'dart:developer';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/resources.dart';
import '../../data/models/dashboard_response.dart';

class LineChartSample extends StatefulWidget {
  final Data? data;
  const LineChartSample({super.key, this.data});

  @override
  State<LineChartSample> createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  late final Data? data = widget.data;
  List<Color> gradientColors = [
    R.colors.primaryColor,
    R.colors.secondaryColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.40,
          child: LineChart(
            mainData(),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    // تحويل البيانات القادمة إلى نقاط FlSpot
    final spots = data!.topFiveSalesPersons?.map((data) {
      final dateString = data.year!.split(':')[0]; // "Sun-Dec-2024"
      final parts = dateString.split('-'); // ["Sun", "Dec", "2024"]

      try {
        // استخراج الشهر والسنة
        final monthName = parts[1]; // "Dec"
        final year = int.tryParse(parts[2]) ?? 0; // "2024"

        // تحويل اسم الشهر إلى رقم الشهر
        final month = {
          "Jan": 1,
          "Feb": 2,
          "Mar": 3,
          "Apr": 4,
          "May": 5,
          "Jun": 6,
          "Jul": 7,
          "Aug": 8,
          "Sep": 9,
          "Oct": 10,
          "Nov": 11,
          "Dec": 12
        }[monthName]!;

        final gdp = double.tryParse(data.gdp!) ?? 0.0; // تحويل gdp إلى double

        return FlSpot(month.toDouble() - 1, gdp); // جعل الشهر يبدأ من 0
      } catch (e) {
        log("Failed to parse date or data: $dateString");
        return const FlSpot(0, 0); // قيمة افتراضية
      }
    }).toList();

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1000,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xffE5E5EF),
            strokeWidth: 1,
            dashArray: [5],
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xffE5E5EF),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1000,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11, // 12 شهر
      minY: 0,
      maxY:
          (spots?.map((e) => e.y).reduce((a, b) => a > b ? a : b) ?? 0) + 1000,
      lineBarsData: [
        LineChartBarData(
          spots: spots ?? [], // تمرير النقاط المولدة هنا
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2.5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = R.textStyles.font10darkBlueGrayW400.copyWith(
      fontSize: 12.sp,
    );
    List<String> months = [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC"
    ];
    String text = (value.toInt() >= 0 && value.toInt() < months.length)
        ? months[value.toInt()]
        : '';
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = R.textStyles.font10darkBlueGrayW400;
    String text = '${value.toInt()}'; // عرض القيم كأرقام صحيحة
    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
