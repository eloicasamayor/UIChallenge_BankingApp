import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:ui_challange_banking_app/constants.dart';
import 'package:ui_challange_banking_app/screens/home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      //pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: CustomPaint(
          //painter: SplashScreenPainter(),
          painter: _OnBoardingScreenPainter(),
        ),
      ),
      IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.transparent,

        /* globalFooter: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            child: const Text(
              'Let\s go right away!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => _onIntroEnd(context),
          ),
        ), */
        pages: [
          PageViewModel(
            title: "Fractional shares",
            body:
                "Instead of having to buy an entire share, invest any amount you want.",
            image: Image.asset('assets/images/splash_screen_img.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Learn as you go",
            body:
                "Download the Stockpile app and master the market with our mini-lesson.",
            image: Image.asset('assets/images/splash_screen_img.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Kids and teens",
            body:
                "Kids and teens can track their stocks 24/7 and place trades that you approve.",
            image: Image.asset('assets/images/splash_screen_img.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        //rtl: true, // Display as right-to-left
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        /* dotsContainerDecorator: const ShapeDecoration(
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ), */
      ),
    ]);
  }
}

class _OnBoardingScreenPainter extends CustomPainter {
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
  bool shouldRepaint(_OnBoardingScreenPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_OnBoardingScreenPainter oldDelegate) => false;
}
