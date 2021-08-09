import 'package:flutter/material.dart';
import 'package:ui_challange_banking_app/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import '../screens/card_detail_screen.dart';
import '../widgets/bank_card.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: AppColors.pink,
        body: CustomPaint(
          painter: _HomeScreenPainter(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
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
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TabBar(
                                  //labelPadding: EdgeInsets.all(0),
                                  unselectedLabelColor: AppColors.purple,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicator: BoxDecoration(
                                    color: AppColors.purple,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  tabs: [
                                    for (var tab
                                        in HomeScreenConstants.tabNames)
                                      Tab(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(tab),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 200,
                                child: TabBarView(
                                  children: [
                                    Container(),
                                    Container(
                                      child: WeekGraph(),
                                    ),
                                    Container(),
                                    Container(),
                                  ],
                                ),
                              ),
                              _RadioButtons(),
                              _Cards(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Cards extends StatelessWidget {
  const _Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Hero(
            tag: 'card',
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(CardDetailScreen.routeName),
              child: BankCard(),
            ),
          ),
          _NewBankCard()
        ],
      ),
    );
  }
}

class _NewBankCard extends StatelessWidget {
  const _NewBankCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
      child: DottedBorder(
        dashPattern: [4, 4],
        color: AppColors.lightBlue,
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: Radius.circular(20.0),
        child: Container(
          //height: 100,
          width: 150,
          margin: EdgeInsets.all(20),
          /* padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ), */
          decoration: BoxDecoration(
            //color: AppColors.purple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_rounded,
                size: 45,
                color: AppColors.lightBlue,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'Add',
                style: HomeScreenConstants.styleLittleText.copyWith(
                  fontSize: 16,
                  color: AppColors.lightBlue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RadioButtons extends StatelessWidget {
  final _radio = ValueNotifier<int>(0);
  _handleRadioValueChange(int value) => _radio.value = value;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _radio,
      builder: (context, int value, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 0,
              groupValue: value,
              activeColor: AppColors.purple,
              onChanged: (i) => _handleRadioValueChange(0),
            ),
            Text(
              'Average',
              style: HomeScreenConstants.styleLittleText
                  .copyWith(color: AppColors.lightBlue),
            ),
            Radio(
              value: 1,
              groupValue: value,
              activeColor: AppColors.purple,
              onChanged: (i) => _handleRadioValueChange(1),
            ),
            Text(
              'This Week',
              style: HomeScreenConstants.styleLittleText
                  .copyWith(color: AppColors.lightBlue),
            ),
          ],
        );
      },
    );
  }
}

class WeekGraph extends StatelessWidget {
  const WeekGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < HomeScreenConstants.weekDayLabels.length; i++)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 10,
                      height:
                          HomeScreenConstants.weekDaySpending[i].toDouble() / 6,
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: HomeScreenConstants.weekDayLabels[i] != 'W'
                              ? AppColors.purple
                              : AppColors.pink,
                          borderRadius: BorderRadius.circular(5)),
                      width: 10,
                      height:
                          HomeScreenConstants.weekDayIncome[i].toDouble() / 6,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  HomeScreenConstants.weekDayLabels[i],
                  style: TextStyle(
                    color: HomeScreenConstants.weekDayLabels[i] != 'W'
                        ? AppColors.lightBlue
                        : AppColors.pink,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
        ],
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
            height: 6,
          ),
          Text(
            'Total Balance',
            style: HomeScreenConstants.styleLittleText,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            '\$995.58',
            style: HomeScreenConstants.styleBigText,
          ),
          SizedBox(
            height: 30,
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
        height: 70,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 16,
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
      height: 70,
      width: MediaQuery.of(context).size.width / 2 -
          MediaQuery.of(context).size.width / 12,
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

class _HomeScreenPainter extends CustomPainter {
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

    canvas.drawPath(pinkTopPath, purplePaint);
    canvas.drawPath(purpleTopPath, pinkPaint);
    //canvas.drawPath(purpleBottomPath, purplePaint);
    //canvas.drawPath(pinkBottomPath, pinkPaint);
  }

  @override
  bool shouldRepaint(_HomeScreenPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_HomeScreenPainter oldDelegate) => false;
}
