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
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/modern_menu_icon.png',
              width: 25,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      backgroundColor: AppColors.pink,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            height: 300,
            width: MediaQuery.of(context).size.width,
            top: 80,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Hero(tag: 'card', child: BankCard()),
            ),
          ),
        ],
      ),
    );
  }
}
