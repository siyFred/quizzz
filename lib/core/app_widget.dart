import 'package:flutter/material.dart';

import 'package:quizzz/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qui.zzZ",
      home: SplashPage(),
    );
  }
}
