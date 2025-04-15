import 'package:flutter/material.dart';
import 'package:quizzz/core/app_colors.dart';
import 'package:quizzz/core/app_text_styles.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;

  const QuizCardWidget({
    super.key, 
    required this.title, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title, 
          style: AppTextStyles.heading15,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}