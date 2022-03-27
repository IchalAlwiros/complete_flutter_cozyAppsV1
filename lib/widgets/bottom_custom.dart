import 'package:bwa_cozy/theme/theme.dart';
import 'package:bwa_cozy/ui/home_screen.dart';
import 'package:flutter/material.dart';

import '../ui/pages/bottom_test.dart';

class BottomCustomNavbar extends StatefulWidget {
  @override
  State<BottomCustomNavbar> createState() => _BottomCustomNavbarState();
}

class _BottomCustomNavbarState extends State<BottomCustomNavbar> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const Page1(),
    const HomeScreen(),
    const Page2(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      // bottomNavigationBar: buildNavbar(),
      floatingActionButton: buildNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Container buildNavbar() {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width - (2 * edge),
      margin: EdgeInsets.symmetric(
        horizontal: edge,
      ),
      decoration: BoxDecoration(
          color: bottomNavbarColor,
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(23),
          boxShadow: [
            BoxShadow(
              color: greyColor,
              offset: const Offset(0, 1),
              blurRadius: 10.0,
              blurStyle: BlurStyle.outer,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              child: IconPress(
                0,
                pageIndex,
                'assets/images/icon_home.png',
              )),
          InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child: IconPress(
                1,
                pageIndex,
                'assets/images/icon_message.png',
              )),
          InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              child: IconPress(
                2,
                pageIndex,
                'assets/images/Icon_card_solid.png',
              )),
          InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              child: IconPress(
                3,
                pageIndex,
                'assets/images/Icon_love_solid.png',
              )),
        ],
      ),
    );
  }
}

class IconPress extends StatelessWidget {
  final int pageIndex;
  final String imageIcon;
  final int index;

  IconPress(
    @required this.index,
    @required this.pageIndex,
    @required this.imageIcon,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageIcon,
          width: 26,
          color: pageIndex == index ? purpelColor : greyColor,
        ),
        Spacer(),
        pageIndex == index
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpelColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      1000,
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
