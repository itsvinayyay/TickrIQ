import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_trace/core/routes/generated_routes.dart';
import 'package:ticket_trace/cubits/earning_calendar_cubit/earning_calendar_cubit.dart';
import 'package:ticket_trace/presentation/earning_results_screen.dart';
import 'package:ticket_trace/presentation/earning_transcript_screen.dart';
import 'package:ticket_trace/presentation/ticker_display.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => EarningCalendarCubit(),
          child: MaterialApp(
            title: 'Flutter Demo',
            onGenerateRoute: GeneratedRoutes.generateRoutes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: TickerDisplay(),
          ),
        );
      },
    );
  }
}
