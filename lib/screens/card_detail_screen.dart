import 'package:flutter/material.dart';
import 'package:ui_challange_banking_app/constants.dart';
import 'package:ui_challange_banking_app/widgets/bank_card.dart';

class CardDetailScreen extends StatelessWidget {
  static const routeName = '/detail_screen';
  const CardDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pink,
        elevation: 0.0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/modern_menu_icon.png',
                width: 25,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      backgroundColor: AppColors.pink,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            height: 500,
            width: MediaQuery.of(context).size.width,
            top: 80,
            child: CardDetails(),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: 230,
              width: MediaQuery.of(context).size.width * 1,
              child: Hero(tag: 'card', child: BankCard()),
            ),
          ),
        ],
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 150),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 100,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Spendings',
                  style: DetailScreenConstants.styleBlueLittleText,
                ),
                Text(
                  '\$995.45',
                  style: DetailScreenConstants.stylePurpleBigText,
                ),
                Text(
                  '10% Below Monthly Average',
                  style: DetailScreenConstants.styleBlueLittleText,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Transactions',
            style: DetailScreenConstants.styleBlueLittleText,
          ),
        ],
      ),
    );
  }
}
