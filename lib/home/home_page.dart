import 'package:flutter/material.dart';
import 'package:quizzz/core/app_colors.dart';
import 'package:quizzz/core/app_gradients.dart';
import 'package:quizzz/core/app_text_styles.dart';
import 'package:quizzz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:quizzz/quiz/quiz_page.dart';
import 'package:quizzz/shared/models/quiz_model.dart';
import 'package:quizzz/shared/models/question_model.dart';
import 'package:quizzz/shared/models/answer_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qui.zzZ', style: AppTextStyles.titleBold),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.linear,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 48),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(
                      quiz: _getQuiz(),
                    ),
                  ),
                );
              },
              child: QuizCardWidget(
                title: 'Quiz de Conhecimentos Gerais',
              ),
            ),
          ],
        ),
      ),
    );
  }

  QuizModel _getQuiz() {
    return QuizModel(
      title: 'Quiz de Conhecimentos Gerais',
      image: 'assets/images/logo.png',
      questions: [
        QuestionModel(
          title: 'Qual é a capital da França?',
          answers: [
            AnswerModel(title: 'Paris', isRight: true),
            AnswerModel(title: 'Londres'),
            AnswerModel(title: 'Berlim'),
            AnswerModel(title: 'Madri'),
          ],
        ),
        QuestionModel(
          title: 'Qual planeta é conhecido como o Planeta Vermelho?',
          answers: [
            AnswerModel(title: 'Terra'),
            AnswerModel(title: 'Marte', isRight: true),
            AnswerModel(title: 'Júpiter'),
            AnswerModel(title: 'Vênus'),
          ],
        ),
        QuestionModel(
          title: 'Qual é o maior mamífero do mundo?',
          answers: [
            AnswerModel(title: 'Elefante'),
            AnswerModel(title: 'Girafa'),
            AnswerModel(title: 'Baleia Azul', isRight: true),
            AnswerModel(title: 'Hipopótamo'),
          ],
        ),
      ],
    );
  }
}
