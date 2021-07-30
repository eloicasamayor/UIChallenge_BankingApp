import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';
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
      home: MyHomePage(title: 'UI Challange: Banking App'),
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CardDetailScreen.routeName: (context) => CardDetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SplashScreen.routeName),
            child: Text('start the app')),
      ),
    );
  }
}
