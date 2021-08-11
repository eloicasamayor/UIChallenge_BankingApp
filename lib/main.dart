import 'package:flutter/material.dart';
import 'package:ui_challange_banking_app/screens/onboarding_screen.dart';
import '../screens/home_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/card_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingPage(),
      routes: {
        //OnBoardingPage.routeName: (context) => OnBoardingPage(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CardDetailScreen.routeName: (context) => CardDetailScreen(),
      },
    );
  }
}
