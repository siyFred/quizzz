import 'package:flutter/material.dart';
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
                      quiz: _getQuizConhecimentosGerais(),
                    ),
                  ),
                );
              },
              child: QuizCardWidget(
                title: 'Quiz de Conhecimentos Gerais',
              ),
            ),
            SizedBox(height: 24),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(
                      quiz: _getQuizLogicaProgramacao(),
                    ),
                  ),
                );
              },
              child: QuizCardWidget(
                title: 'Quiz de Lógica de Programação',
              ),
            ),
          ],
        ),
      ),
    );
  }

  QuizModel _getQuizConhecimentosGerais() {
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
  
  QuizModel _getQuizLogicaProgramacao() {
    return QuizModel(
      title: 'Quiz de Lógica de Programação',
      image: 'assets/images/logo.png',
      questions: [
        QuestionModel(
          title: 'O que é um algoritmo?',
          answers: [
            AnswerModel(title: 'Um tipo de linguagem de programação'),
            AnswerModel(title: 'Uma sequência finita de passos para resolver um problema', isRight: true),
            AnswerModel(title: 'Um componente físico do computador'),
            AnswerModel(title: 'Um software antivírus'),
          ],
        ),
        QuestionModel(
          title: 'Qual estrutura é usada para repetir um bloco de código várias vezes?',
          answers: [
            AnswerModel(title: 'Estrutura condicional'),
            AnswerModel(title: 'Estrutura de repetição', isRight: true),
            AnswerModel(title: 'Estrutura sequencial'),
            AnswerModel(title: 'Estrutura de dados'),
          ],
        ),
        QuestionModel(
          title: 'Qual destes NÃO é um operador lógico?',
          answers: [
            AnswerModel(title: 'AND'),
            AnswerModel(title: 'OR'),
            AnswerModel(title: 'NOT'),
            AnswerModel(title: 'MAYBE', isRight: true),
          ],
        ),
      ],
    );
  }
}
