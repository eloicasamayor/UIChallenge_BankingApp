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
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: DefaultTabController(
                      initialIndex: 1,
                      length: HomeScreenConstants.tabNames.length,
                      child: Column(
                        children: [
                          TabBar(tabs: [
                            GraphTab(title: 'day'),
                            GraphTab(title: 'week'),
                            GraphTab(title: 'month'),
                            GraphTab(title: 'year'),
                          ])
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GraphTab extends StatelessWidget {
  final String title;
  const GraphTab({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(title, style: TextStyle(color: Colors.black)),
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
          MainTabs(
            spendings: true,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MainTabs extends StatefulWidget {
  bool spendings;
  MainTabs({
    Key? key,
    required this.spendings,
  }) : super(key: key);

  @override
  _MainTabsState createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> {
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
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              widget.spendings = !widget.spendings;
            });
          },
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: MainTab(
                  selected: widget.spendings,
                  title: 'Spendings',
                  amount: '\$995.45',
                ),
              ),
              Positioned(
                right: 0,
                child: MainTab(
                  selected: !widget.spendings,
                  title: 'Income',
                  amount: '\$1995.45',
                ),
              ),
            ],
          ),
        ));
  }
}

class MainTab extends StatelessWidget {
  bool selected;
  final String title;
  final String amount;
  MainTab({
    Key? key,
    required this.selected,
    required this.title,
    required this.amount,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 170,
      decoration: BoxDecoration(
        color: selected ? AppColors.purple : AppColors.lightPink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: selected
                ? HomeScreenConstants.styleLittleText
                : HomeScreenConstants.styleLittleText.copyWith(
                    color: Color(0xAAFFFFFF),
                  ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            amount,
            style: selected
                ? HomeScreenConstants.styleMediumText
                : HomeScreenConstants.styleMediumText
                    .copyWith(color: Color(0xAAFFFFFF)),
          ),
        ],
      ),
    );
  }
}
