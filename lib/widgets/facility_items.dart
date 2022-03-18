import 'package:bwa_cozy/theme/theme.dart';
import 'package:flutter/material.dart';

class FacilityItems extends StatelessWidget {
  final String name, imageUrl;
  final int total;

  FacilityItems(
    this.name,
    this.imageUrl,
    this.total,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
          height: 28,
        ),
        Text.rich(
          TextSpan(
              text: '$total',
              style: purpleTextStyle.copyWith(
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: name,
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                  ),
                )
              ]),
        ),
      ],
    );
  }
}
