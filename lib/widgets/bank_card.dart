import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/card_detail_screen.dart';

class BankCard extends StatelessWidget {
  const BankCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100,
      width: 190,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/visa_logo.png',
            width: 45,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            '1456  5878  2695  0320',
            style: HomeScreenConstants.styleLittleText.copyWith(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
