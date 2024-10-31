// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ticket_trace/constants/api_mimic.dart';
import 'package:ticket_trace/core/theme.dart';
import 'package:ticket_trace/cubits/earning_calendar_cubit/earning_calendar_cubit.dart';
import 'package:ticket_trace/cubits/earning_calendar_cubit/earning_calendar_states.dart';
import 'package:ticket_trace/data/models/earning_calendar_model.dart';
import 'package:ticket_trace/utils/eps_growth_calculation.dart';
import 'package:ticket_trace/utils/eps_surprise_calculator.dart';
import 'package:ticket_trace/utils/revenue_growth_calculation.dart';
import 'package:ticket_trace/utils/revenue_surprise_calculation.dart';
import 'package:ticket_trace/widgets/custom_analytic_card.dart';
import 'package:ticket_trace/widgets/custom_line_chart.dart';

class EarningResultsScreen extends StatefulWidget {
  final String ticker;
  const EarningResultsScreen({super.key, required this.ticker});

  @override
  State<EarningResultsScreen> createState() => _EarningResultsScreenState();
}

class _EarningResultsScreenState extends State<EarningResultsScreen> {
  late EarningCalendarCubit _earningCalendarCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _earningCalendarCubit = BlocProvider.of<EarningCalendarCubit>(context);
    _earningCalendarCubit.fetchEarningResults(ticker: widget.ticker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.darkNavy,
            AppColors.lightNavy,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              BlocBuilder<EarningCalendarCubit, EarningCalendarStates>(
                  builder: (context, state) {
                if (state is EarningLoadingState ||
                    state is EarningInitialState) {
                  return Center(
                      child: SpinKitWaveSpinner(
                    color: AppColors.fuelGreen,
                    waveColor: Color(0xFFFFA726),
                    size: 120.sp,
                  ));
                }
                if (state is EarningErrorState) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.white),
                  );
                }
                if (state.earningResults.isEmpty) {
                  return Column(
                    children: [
                      Text(
                        "Graph Not Loaded!",
                        style: TextStyle(
                            fontFamily: "dmSans",
                            color: Colors.red,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            height: 1.2),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Yikes! The graph took a detour. Double-check the ticker, and we’ll get back on track!",
                        style: TextStyle(
                            fontFamily: "dmSans",
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16.sp,
                            height: 1),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "The Ticker you provided:",
                        style: TextStyle(
                            fontFamily: "dmSans",
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            height: 1.2),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.ticker,
                        style: TextStyle(
                            fontFamily: "dmSans",
                            color: AppColors.warmYellow,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            height: 1.2),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }
                return CustomLineChart(
                  earningResults: state.earningResults,
                  ticker: widget.ticker,
                );
              }),
              SizedBox(
                height: 40,
              ),
              Text(
                "Key Performance Highlights",
                style: TextStyle(
                    fontFamily: "dmSans",
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.2),
              ),
              SizedBox(
                height: 25,
              ),
              BlocBuilder<EarningCalendarCubit, EarningCalendarStates>(
                  builder: (context, state) {
                if (state is EarningLoadingState ||
                    state is EarningInitialState) {
                  return Expanded(
                    child: Center(
                        child: SpinKitPouringHourGlass(
                      color: AppColors.fuelGreen,
                      size: 120.sp,
                    )),
                  );
                } else if (state is EarningErrorState) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.white),
                  );
                }
                if (state.earningResults.isEmpty) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Metrics Not Loaded",
                          style: TextStyle(
                              fontFamily: "dmSans",
                              color: Colors.red,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              height: 1.2),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Metrics on pause! Looks like the ticker code needs a quick tune-up to bring them to life.",
                          style: TextStyle(
                              fontFamily: "dmSans",
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16.sp,
                              height: 1),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                }
                final double epsSurp =
                    epsSurprise(earningResults: state.earningResults);
                final double revenueSupr =
                    revenueSurprise(earningResults: state.earningResults);
                final double epsgrowth =
                    epsGrowth(earningResults: state.earningResults);
                final double revenuegrowth =
                    revenueGrowth(earningResults: state.earningResults);
                return Expanded(
                  child: GridView(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 0.85, // Adjust this value as needed
                    ),
                    children: [
                      CustomAnalyticCard(
                        percentage: epsSurp.toStringAsFixed(2),
                        iconName: "diagram",
                        description: "Average EPS Surprise",
                        isPositive: epsSurp >= 0,
                      ),
                      CustomAnalyticCard(
                        percentage: revenueSupr.toStringAsFixed(2),
                        iconName: "chart",
                        description: "Average Revenue Surprise",
                        isPositive: revenueSupr >= 0,
                      ),
                      CustomAnalyticCard(
                        percentage: epsgrowth.toStringAsFixed(2),
                        iconName: "sprout",
                        description: "EPS Growth Over Period",
                        isPositive: epsgrowth >= 0,
                      ),
                      CustomAnalyticCard(
                        percentage: revenuegrowth.toStringAsFixed(2),
                        iconName: "growth",
                        description: "Revenue Growth Over Period",
                        isPositive: epsgrowth >= 0,
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        )),
      ),
    );
  }
}
