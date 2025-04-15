import 'package:flutter/material.dart';

import 'package:quizzz/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qui.zzZ",
      home: SplashPage(),
    );
  }
}
