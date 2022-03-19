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
        color: Color.fromARGB(255, 235, 235, 235),
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/images/icon_home.png',
                    width: 26,
                    color: pageIndex == 0 ? purpelColor : greyColor,
                  ),
                  Spacer(),
                  pageIndex == 0
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
              )),
          InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/images/icon_message.png',
                    width: 26,
                    color: pageIndex == 1 ? purpelColor : greyColor,
                  ),
                  Spacer(),
                  pageIndex == 1
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
              )),
          InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/images/Icon_card_solid.png',
                    width: 26,
                    color: pageIndex == 2 ? purpelColor : greyColor,
                  ),
                  Spacer(),
                  pageIndex == 2
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
              )),
          InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/images/Icon_love_solid.png',
                    width: 26,
                    color: pageIndex == 3 ? purpelColor : greyColor,
                  ),
                  Spacer(),
                  pageIndex == 3
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
              )),
          // BottomNavBarItem(
          //   'assets/images/icon_home.png',
          //   // false,
          //   0,
          // ),
          // BottomNavBarItem(
          //   'assets/images/icon_message.png',
          //   // false,
          //   1,
          // ),
          // BottomNavBarItem(
          //   'assets/images/Icon_card_solid.png',
          //   // false,
          //   2,
          // ),
          // BottomNavBarItem(
          //   'assets/images/Icon_love_solid.png',
          //   // false,
          //   3,
          // )
        ],
      ),
    );
  }
}
