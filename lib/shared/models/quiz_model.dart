import 'package:quizzz/shared/models/question_model.dart';

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final String image;

  QuizModel({
    required this.title,
    required this.questions,
    required this.image,
  });
}
