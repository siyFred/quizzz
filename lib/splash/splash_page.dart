import 'package:flutter/material.dart';
import 'package:quizzz/core/app_gradients.dart';
import 'package:quizzz/core/app_images.dart';
import 'package:quizzz/home/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) => 
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => HomePage())
      )
    );
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
