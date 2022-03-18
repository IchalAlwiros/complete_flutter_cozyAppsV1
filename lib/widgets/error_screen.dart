import 'package:bwa_cozy/theme/theme.dart';
import 'package:bwa_cozy/ui/home_screen.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/404.png',
              width: 300,
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              'Where are you going?',
              style: blackTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Seems like the page that you were \nrequested is already gone',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width / 2,
              margin: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              decoration: BoxDecoration(
                color: purpelColor,
                shape: BoxShape.circle,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: purpelColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: Text(
                  'Back to home',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
