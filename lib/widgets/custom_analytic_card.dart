import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAnalyticCard extends StatelessWidget {
  final String percentage;
  final String iconName;
  final String description;
  final bool isPositive;
  const CustomAnalyticCard({
    Key? key,
    required this.percentage,
    required this.iconName,
    required this.description,
    required this.isPositive
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          isPositive ? Color(0XFF279646).withOpacity(0.5) : Colors.red.withOpacity(0.5),
         isPositive ? Color(0XFF279646).withOpacity(0.2) : Colors.red.withOpacity(0.2),
          Colors.transparent
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        children: [
          SvgPicture.asset("assets/icons/$iconName.svg", width: 60.w,),
          SizedBox(
            height: 15,
          ),
          Text(
            "$percentage%",
            style: TextStyle(
                fontFamily: "dmSans",
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                height: 1),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            description,
            style: TextStyle(
                fontFamily: "dmSans",
                color: Colors.white.withOpacity(0.5),
                fontSize: 11.sp,
                height: 1),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
