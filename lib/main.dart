import 'package:bwa_cozy/provider/space_provider.dart';
import 'package:bwa_cozy/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        // builder: ((context, child) {
        //   return ScrollConfiguration(behavior: MyBehavior(), child: child)
        // }),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

// class MyBehavior extends ScrollBehavior {
//   @override
//   Widget buildOverscrollIndicator(
//       BuildContext context, Widget child, ScrollableDetails details) {
//     return child;
//   }
// }