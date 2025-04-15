import 'package:flutter/material.dart';
import 'package:quizzz/core/app_colors.dart';
import 'package:quizzz/core/app_gradients.dart';
import 'package:quizzz/core/app_text_styles.dart';
import 'package:quizzz/home/home_page.dart';

class ResultsPage extends StatelessWidget {
  final String title;
  final int questionsLength;
  final double result;

  const ResultsPage({
    super.key,
    required this.title,
    required this.questionsLength,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final int correctAnswers = (result / 100 * questionsLength).round();

    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados", style: AppTextStyles.titleBold),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.linear,
          ),
        ),
        automaticallyImplyLeading: false, // Impede a exibição da seta de voltar
        leading: Container(), // Adiciona um container vazio no lugar da seta
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quiz Concluído!",
                    style: AppTextStyles.heading,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    title,
                    style: AppTextStyles.bodyBold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$correctAnswers",
                        style: AppTextStyles.heading40,
                      ),
                      Text(
                        "/$questionsLength",
                        style: AppTextStyles.body20,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Score: ${result.toStringAsFixed(0)}%",
                    style: AppTextStyles.heading,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Voltar para a HomePage",
                style: AppTextStyles.bodyWhite20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}