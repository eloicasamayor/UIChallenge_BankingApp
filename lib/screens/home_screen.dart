import 'package:flutter/material.dart';
import 'package:ui_challange_banking_app/constants.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppColors.pink,
        body: SafeArea(
          minimum: const EdgeInsets.all(0.0),
          top: true,
          bottom: false,
          child: Column(
            children: [
              _Header(),
              Text('hola'),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
        right: 6,
        left: 6,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
          SizedBox(
            height: 10,
          ),
          Text(
            'Total Balance',
            style: HomeScreenConstants.styleLittleText,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '\$995.58',
            style: HomeScreenConstants.styleBigText,
          ),
          SizedBox(
            height: 40,
          ),
          MainTabs(),
        ],
      ),
    );
  }
}

class MainTabs extends StatelessWidget {
  const MainTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightPink,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: MainTab(
                selected: true,
                title: 'Spendings',
                amount: '\$995.45',
              ),
            ),
            Positioned(
              right: 0,
              child: MainTab(
                selected: false,
                title: 'Income',
                amount: '\$1995.45',
              ),
            ),
          ],
        ));
  }
}

class MainTab extends StatefulWidget {
  final bool selected;
  final String title;
  final String amount;
  const MainTab({
    Key? key,
    required this.selected,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        height: 80,
        width: 170,
        decoration: BoxDecoration(
          color: widget.selected ? AppColors.purple : AppColors.lightPink,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: HomeScreenConstants.styleLittleText,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.amount,
              style: HomeScreenConstants.styleMediumText,
            ),
          ],
        ),
      ),
    );
  }
}
