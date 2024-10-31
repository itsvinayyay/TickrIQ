import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_trace/core/routes/named_routes.dart';
import 'package:ticket_trace/widgets/custom_textformfield.dart';

class TickerDisplay extends StatelessWidget {
  TickerDisplay({super.key});

  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: const Color(0XFF12121C),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Image.asset(
                      "assets/images/tickerDisplay.gif",
                      width: 200.w,
                    )
                        .animate() // delays start until after the first text
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: 0.5, duration: 500.ms),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Discover Market Trends Instantly!",
                      style: TextStyle(
                          fontFamily: "dmSans",
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          height: 1),
                      textAlign: TextAlign.center,
                    )
                        .animate(delay: 300.ms)
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: 0.5, duration: 500.ms),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Type in a stock ticker (like AAPL for Apple) and watch the market insights unfold!",
                      style: TextStyle(
                          fontFamily: "dmSans",
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16.sp,
                          height: 1),
                      textAlign: TextAlign.center,
                    )
                        .animate(
                            delay: 800
                                .ms) // delays start until after the first text
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: 0.5, duration: 500.ms),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      textEditingController: _textEditingController,
                      hintText: "AAPL or MSFT",
                    )
                        .animate(
                            delay: 1300
                                .ms) // delays start until after the first text
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: 0.5, duration: 500.ms),
                    const SizedBox(
                      height: 25,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (_textEditingController.text.trim() == '') {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Please provide a ticker!")));
                        } else {
                          Navigator.pushNamed(
                              context, Routes.earningResultsScreen,
                              arguments: _textEditingController.text.trim());
                        }
                      },
                      child: CircleAvatar(
                        radius: 30.sp,
                        backgroundColor: const Color(0XFF279646),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                    )
                        .animate(
                            delay: 1800
                                .ms) // delays start until after the first text
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: 0.5, duration: 500.ms),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
