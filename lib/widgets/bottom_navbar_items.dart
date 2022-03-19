import 'package:bwa_cozy/theme/theme.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatefulWidget {
  final String? imageUrl;
  int index;

  BottomNavBarItem(
    this.imageUrl,
    // this.isActive,
    this.index,
  );

  @override
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

int pageIndex = 0;

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  // final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          pageIndex = widget.index;
        });
      },
      child: Column(
        children: [
          Spacer(),
          Image.asset(
            widget.imageUrl!,
            width: 26,
            color: pageIndex == widget.index ? Colors.red : Colors.black,
          ),
          Spacer(),
          // isActive!
          pageIndex == widget.index
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
      ),
    );
  }
}
