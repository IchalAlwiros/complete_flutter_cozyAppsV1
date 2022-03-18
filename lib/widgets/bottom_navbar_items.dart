import 'package:bwa_cozy/theme/theme.dart';
import 'package:bwa_cozy/ui/pages/page_1.dart';
import 'package:bwa_cozy/ui/pages/page_2.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatefulWidget {
  final String? imageUrl;
  final bool? isActive;

  BottomNavBarItem(
    this.imageUrl,
    this.isActive,
  );

  @override
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  int pageIndex = 0;

  final pages = [
    Page1(),
    Page2(),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
        enableFeedback: false,
        onTap: () {
          setState(() {
            pageIndex = 0;
          });
        },
        child: pageIndex == 0
            ? Column(
                children: [
                  Spacer(),
                  Image.asset(
                    widget.imageUrl!,
                    width: 26,
                    color: greyColor,
                  ),
                  Spacer(),
                  // widget.isActive!
                  //     ? Container(
                  //         width: 30,
                  //         height: 2,
                  //         decoration: BoxDecoration(
                  //           color: purpelColor,
                  //           borderRadius: BorderRadius.vertical(
                  //             top: Radius.circular(
                  //               1000,
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     :
                  Container()
                ],
              )
            : Column(
                children: [
                  Spacer(),
                  Image.asset(
                    widget.imageUrl!,
                    width: 26,
                    color: purpelColor,
                  ),
                  Spacer(),
                  // widget.isActive!
                  //?
                  Container(
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
                  //:
                  // Container()
                ],
              ));
  }
}
