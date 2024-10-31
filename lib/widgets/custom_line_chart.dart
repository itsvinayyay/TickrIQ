// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:ticket_trace/constants/api_mimic.dart';
import 'package:ticket_trace/core/routes/named_routes.dart';
import 'package:ticket_trace/data/models/earning_calendar_model.dart';
import 'package:ticket_trace/data/models/earning_call_navigation_model.dart';
import 'package:ticket_trace/utils/quarter_calculation.dart';
import 'package:ticket_trace/utils/year_calculation.dart';

class CustomLineChart extends StatelessWidget {
  final List<EarningCalendarModel> earningResults;
  final String ticker;
  const CustomLineChart({
    super.key,
    required this.earningResults,
    required this.ticker,
  });

  @override
  Widget build(BuildContext context) {
    // Mapping actual_eps and estimated_eps data
    List<FlSpot> actualEpsSpots = earningResults.asMap().entries.map((entry) {
      int index = entry.key;
      double value = entry.value.actualEps ?? 0;
      return FlSpot(index.toDouble(), value);
    }).toList();
    List<FlSpot> estimatedEpsSpots =
        earningResults.asMap().entries.map((entry) {
      int index = entry.key;
      double value = entry.value.estimatedEps ?? 0;
      return FlSpot(index.toDouble(), value);
    }).toList();

    final Set<double> uniqueYValues = {
      ...actualEpsSpots.map((spot) => spot.y),
      ...estimatedEpsSpots.map((spot) => spot.y),
    };

    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        duration: Duration(milliseconds: 150), // Optional
        curve: Curves.linear,
        LineChartData(
          lineTouchData: LineTouchData(
            enabled: true,
            touchCallback: (touchEvent, touchResponse) {
              if (touchEvent.isInterestedForInteractions) {
                final touchedSpots = touchResponse!.lineBarSpots;
                if (touchedSpots != null && touchedSpots.isNotEmpty) {
                  final dateIndex = touchedSpots.first.x.toInt();
                  final date = earningResults[dateIndex].pricedate;
                  log(date.toString());
                  EarningCallNavigationModel earningCallNavigationModel =
                      EarningCallNavigationModel(
                          ticker: ticker,
                          year: getYear(date: date!),
                          quarter: getQuarter(date).toString());

                  Navigator.pushNamed(context, Routes.earningTranscriptScreen,
                      arguments: earningCallNavigationModel);
                }
              }
            },
          ),
          lineBarsData: [
            LineChartBarData(
              color: Color(0xFF279646),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF279646).withOpacity(0.5),
                    Color(0xFF279646).withOpacity(0.2),
                    Colors.transparent
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              barWidth: 4,
              spots: actualEpsSpots, // Injecting actual_eps data here
              isCurved: true,
              preventCurveOverShooting: true,
            ),

            // Line for estimated_eps
            LineChartBarData(
              color: Color(0xFFFFA726),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFA726).withOpacity(0.5),
                    Color(0xFFFFA726).withOpacity(0.2),
                    Colors.transparent
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              barWidth: 4,
              spots: estimatedEpsSpots, // Injecting estimated_eps data here
              isCurved: true,
              preventCurveOverShooting: true,
            ),
          ],
          borderData: FlBorderData(show: false),
          gridData: FlGridData(drawVerticalLine: false),
          titlesData: FlTitlesData(
              // bottomTitles: AxisTitles(
              //   sideTitles: SideTitles(
              //     showTitles: true,
              //     getTitlesWidget: (value, meta) {
              //       int index = value.toInt();
              //       // Check if the index is within the bounds of demoEarnings
              //       if (index >= 0 && index < demoEarnings.length) {
              //         // Format date for each x-axis point
              //         String date = demoEarnings[index].pricedate!;
              //         return Text(date,
              //             style: TextStyle(color: Colors.white, fontSize: 12));
              //       }
              //       return Text('');
              //     },
              //     reservedSize: 40, // Adjust for padding
              //     interval: 1, // Show title only for each node index
              //   ),
              // ),
              // Removes duplicates and sorts
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    // Format the date as needed (this example assumes `actualEpsSpots` are in the right order)
                    final dateIndex = value.toInt();
                    String displayDate =
                        (dateIndex >= 0 && dateIndex < actualEpsSpots.length)
                            ? demoEarnings[dateIndex].pricedate!
                            : '';

                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 8.0, // Add some spacing
                      child: Transform.rotate(
                        angle:
                            -1.57, // Rotates text vertically (90 degrees counter-clockwise)
                        child: Text(
                          displayDate,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    );
                  },
                  reservedSize: 40,
                ),
              ),
              // Create a set of unique y-axis EPS values

              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    // Allow for a small tolerance in matching float values
                    const double tolerance = 0.01;
                    bool isCloseMatch =
                        uniqueYValues.any((y) => (y - value).abs() < tolerance);

                    // Only show labels for EPS values
                    if (isCloseMatch) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          value.toStringAsFixed(2),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      );
                    }
                    return const SizedBox.shrink(); // Hide non-matching values
                  },
                  reservedSize: 40,
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false))),
        ),
      ),
    );
  }
}
