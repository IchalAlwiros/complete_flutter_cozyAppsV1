import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int ratings;

  RatingItem(this.index, this.ratings);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      // index <= ratings ?
      'assets/images/Icon_star_solid.png',
      // : 'assets/images/Icon_star_solid2.png',
      width: 20,
      color: index <= ratings ? Colors.orangeAccent : Colors.grey,
    );
  }
}
