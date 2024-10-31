// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:ticket_trace/core/theme.dart';
import 'package:ticket_trace/cubits/earning_call_cubit/earning_call_cubit.dart';
import 'package:ticket_trace/data/models/earning_call_navigation_model.dart';
import 'package:ticket_trace/data/models/earning_call_states.dart';

class EarningTranscriptScreen extends StatefulWidget {
  final EarningCallNavigationModel earningCallNavigationModel;
  const EarningTranscriptScreen({
    super.key,
    required this.earningCallNavigationModel,
  });

  @override
  State<EarningTranscriptScreen> createState() =>
      _EarningTranscriptScreenState();
}

class _EarningTranscriptScreenState extends State<EarningTranscriptScreen> {
  late EarningCallCubit _earningCallCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _earningCallCubit = BlocProvider.of<EarningCallCubit>(context);
    _earningCallCubit.fetchEarningCallTranscript(
        ticker: widget.earningCallNavigationModel.ticker,
        year: widget.earningCallNavigationModel.year,
        quarter: widget.earningCallNavigationModel.quarter);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _earningCallCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.darkNavy,
          AppColors.lightNavy,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/transcript.png",
                    width: 100.w,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "- Thank you for joining our earnings call. We're excited to share our latest results and future outlook with you.",
                        style: TextStyle(
                          fontFamily: "dmSans",
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16.sp,
                          height: 1.2,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Transcript of Our Latest Earnings Call",
                style: TextStyle(
                    fontFamily: "dmSans",
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<EarningCallCubit, EarningCallStates>(
  builder: (context, state) {
    if (state is EarningCallErrorState) {
      return Text(state.errorMessage);
    } else if (state is EarningCallLoadedState) {
      return Expanded(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Text(
            state.transcript,
            style: TextStyle(
              fontFamily: "dmSans",
              color: Colors.white.withOpacity(0.6),
              fontSize: 16.sp,
              height: 1.4,
              decoration: TextDecoration.none,
            ),
          )
          .animate() // Apply animation to the entire text widget
          .fadeIn(duration: 500.ms) // Duration can be adjusted
          .moveY(begin: 30, end: 0, duration: 500.ms), // Slight upward slide effect
        ),
      );
    }

    return Expanded(child: Center(child: SpinKitWaveSpinner(color: AppColors.fuelGreen, size: 120.sp,)));
  }
)

            ],
          ),
        ),
      ),
    );
  }
}
