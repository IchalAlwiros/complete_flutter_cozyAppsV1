import 'package:bwa_cozy/theme/theme.dart';
import 'package:flutter/material.dart';

import '../models/city.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl!,
                  height: 102,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                city.isPopular!
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: purpelColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                20,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/Icon_star_solid.png',
                              width: 22,
                              height: 22,
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name!,
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
