import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppColors {
  static const purple = Color(0XFF700b59);
  static const lightPurple = Color(0XFF781764);

  static const pink = Color(0XFFee316b);
  static const lightPink = Color(0XFFf0487b);

  static const lightBlue = Color(0XFF5ad3e1);
  static const lightGrey = Color(0XFFf7f7f7);
}

class HomeScreenConstants {
  static const tabNames = ['Day', 'Week', 'Month', 'Year'];
  static const weekDayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  static const weekDayIncome = [550, 430, 300, 860, 660, 410, 900];
  static const weekDaySpending = [99, 555, 387, 987, 690, 321, 999];

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

class DetailScreenConstants {
  static const styleBlueLittleText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.lightBlue,
    letterSpacing: -0.8,
  );
  static const stylePurpleBigText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.4,
    color: AppColors.purple,
  );
  static const stylePinkMediumText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.pink,
  );

  static const transactions = [
    const Transaction(
        title: 'Netflix Subscription',
        date: '11/11/2020 20:35',
        amount: 10.00,
        icon: FontAwesomeIcons.napster),
    const Transaction(
      title: 'Dribbble Pro Account',
      date: '11/11/2020 20:35',
      amount: 15.00,
      icon: FontAwesomeIcons.dribbble,
    ),
    const Transaction(
      title: 'Uber',
      date: '11/11/2020 20:35',
      amount: 22.00,
      icon: FontAwesomeIcons.uber,
    ),
    const Transaction(
        title: 'Grocery Shopping',
        date: '11/11/2020 20:35',
        amount: 10.00,
        icon: FontAwesomeIcons.shoppingCart),
  ];
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
