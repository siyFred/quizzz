import 'package:quizzz/shared/models/answer_model.dart';

class QuestionModel {
  final String question;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.question,
    required this.answers,
  })
  : assert(answers.length == 4);
}