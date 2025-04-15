import 'package:flutter/material.dart';
import 'package:quizzz/core/core.dart';
import 'package:quizzz/shared/models/quiz_model.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;
  
  const QuizCardWidget({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.border),
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 16),
          Text(
            quiz.title,
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "${quiz.questions.length} questões",
                style: AppTextStyles.body11,
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // TODO: nagevacao pro quiz
                },
                child: Text(
                  "Jogar",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}