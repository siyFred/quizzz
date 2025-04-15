import 'package:flutter/material.dart';
import 'package:quizzz/core/app_colors.dart';
import 'package:quizzz/core/app_gradients.dart';
import 'package:quizzz/core/app_text_styles.dart';
import 'package:quizzz/quiz/widgets/answer_widget.dart';
import 'package:quizzz/quiz/quiz_controller.dart';
import 'package:quizzz/results/results_page.dart';
import 'package:quizzz/shared/models/quiz_model.dart';

class QuizPage extends StatefulWidget {
  final QuizModel quiz;

  const QuizPage({super.key, required this.quiz});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final controller = QuizController();
  final pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
  }

  void nextPage() {
    if (currentPage < widget.quiz.questions.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(
            result: controller.result,
            title: widget.quiz.title,
            questionsLength: widget.quiz.questions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title, style: AppTextStyles.titleBold),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.linear,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pergunta ${currentPage + 1}",
                  style: AppTextStyles.heading,
                ),
                Text(
                  "de ${widget.quiz.questions.length}",
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.quiz.questions.length,
              itemBuilder: (context, index) {
                final question = widget.quiz.questions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        question.title,
                        style: AppTextStyles.heading,
                      ),
                      SizedBox(height: 24),
                      ...question.answers.map(
                        (answer) => AnswerWidget(
                          answer: answer,
                          isSelected: answer == controller.selectedAnswer,
                          disabled: controller.hasAnswered,
                          showCorrect: controller.hasAnswered,
                          onTap: () {
                            setState(() {
                              if (!controller.hasAnswered) {
                                controller.answerQuestion(answer);
                                
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      controller.isCurrentAnswerCorrect == true
                                          ? "Correto! Boa resposta!"
                                          : "Incorreto! A resposta correta está destacada.",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    backgroundColor: controller.isCurrentAnswerCorrect == true
                                        ? AppColors.darkGreen
                                        : AppColors.darkRed,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.hasAnswered
                          ? () {
                              controller.nextQuestion();
                              nextPage();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purple,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        currentPage < widget.quiz.questions.length - 1
                            ? "PRÓXIMA"
                            : "FINALIZAR",
                        style: AppTextStyles.bodyWhite20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}