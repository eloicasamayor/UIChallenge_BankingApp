import 'package:flutter/material.dart';
import 'package:ui_challange_banking_app/screens/home_screen.dart';
import '../constants.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: CustomPaint(
          painter: _SplashScreenPainter(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset('assets/images/splash_screen_img.png'),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stay Secure',
                      style: styleBigText,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non neque nulla.',
                      style: styleLittleText,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Indicators(),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        HomeScreen.routeName,
                      ),
                      child: Text(
                        'Skip',
                        style: styleLittleText,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Indicators extends StatelessWidget {
  const Indicators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      child: Row(
        children: [
          Container(
            width: 10,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(2),
            ),
            width: 10,
          ),
          SizedBox(width: 10),
          Container(
            width: 20,
            decoration: BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

class _SplashScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var height = size.height;
    var width = size.width;

    Paint purplePaint = Paint()
      ..color = AppColors.purple
      ..style = PaintingStyle.fill;

    Paint pinkPaint = Paint()
      ..color = AppColors.pink
      ..style = PaintingStyle.fill;

    Path purpleTopPath = Path()
      ..lineTo(0, 120)
      ..quadraticBezierTo(80, 100, 160, 0);

    Path pinkTopPath = Path()
      ..lineTo(0, 180)
      ..quadraticBezierTo(60, 90, 180, 65)
      ..quadraticBezierTo(260, 50, 280, 0);

    Path purpleBottomPath = Path()
      ..moveTo(width - 300, height)
      ..quadraticBezierTo(width - 280, height - 90, width - 120, height - 110)
      ..quadraticBezierTo(width - 30, height - 128, width, height - 130)
      ..lineTo(width, height);

    Path pinkBottomPath = Path()
      ..moveTo(width - 180, height)
      ..quadraticBezierTo(width - 165, height - 60, width - 90, height - 90)
      ..quadraticBezierTo(width - 30, height - 105, width, height - 90)
      ..lineTo(width, height);

    canvas.drawPath(pinkTopPath, pinkPaint);
    canvas.drawPath(purpleTopPath, purplePaint);
    canvas.drawPath(purpleBottomPath, purplePaint);
    canvas.drawPath(pinkBottomPath, pinkPaint);
  }

  @override
  bool shouldRepaint(_SplashScreenPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_SplashScreenPainter oldDelegate) => false;
}
