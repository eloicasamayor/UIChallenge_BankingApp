import 'package:flutter/material.dart';

class AppColors {
  static const purple = Color(0XFF700b59);
  static const lightPurple = Color(0XFF781764);

  static const pink = Color(0XFFee316b);
  static const lightPink = Color(0XFFf0487b);

  static const lightBlue = Color(0XFF5ad3e1);
  static const lightGrey = Color(0XFFf1f1f1);
}

class HomeScreenConstants {
  static const tabNames = ['Day', 'Week', 'Month', 'Year'];
  static const weekDayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  static const styleLittleText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const styleMediumText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.4,
    color: Colors.white,
  );

  static const styleBigText = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    letterSpacing: -1.4,
    color: Colors.white,
  );
}

const styleBigText = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: AppColors.purple,
);

const styleMediumText = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: AppColors.purple,
);

const styleLittleText = TextStyle(
  fontSize: 15,
  height: 1.4,
  fontWeight: FontWeight.bold,
  color: AppColors.lightBlue,
);
