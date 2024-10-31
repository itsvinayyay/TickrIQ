import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import 'package:ticket_trace/core/routes/named_routes.dart';
import 'package:ticket_trace/cubits/earning_calendar_cubit/earning_calendar_cubit.dart';
import 'package:ticket_trace/cubits/earning_call_cubit/earning_call_cubit.dart';
import 'package:ticket_trace/data/models/earning_call_navigation_model.dart';
import 'package:ticket_trace/presentation/earning_results_screen.dart';
import 'package:ticket_trace/presentation/earning_transcript_screen.dart';

class GeneratedRoutes {
  static Route generateRoutes(RouteSettings routeSettings) {
    log("Navigating to Route!!!=====>> ${routeSettings.name}");

    switch (routeSettings.name) {
      case Routes.earningResultsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => EarningCalendarCubit(),
                  child: EarningResultsScreen(
                    ticker: routeSettings.arguments as String,
                  ),
                ),
            settings: routeSettings);
      case Routes.earningTranscriptScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => EarningCallCubit(),
                  child: EarningTranscriptScreen(
                    earningCallNavigationModel:
                        routeSettings.arguments as EarningCallNavigationModel,
                  ),
                ),
            settings: routeSettings);

      default:
        return errorScreen();
    }
  }

  static MaterialPageRoute<dynamic> errorScreen() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: SafeArea(
          child: Text("Error here!"),
        ),
      ),
    );
  }
}
