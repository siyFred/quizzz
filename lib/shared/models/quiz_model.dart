import 'package:quizzz/shared/models/question_model.dart';

class QuizModel {
  final String title;
  final List<QuestionModel> questions;

  QuizModel({
    required this.title,
    required this.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
  return QuizModel(
    title: json['title'] as String,
    questions: (json['questions'] as List)
      .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
    );
  }
}