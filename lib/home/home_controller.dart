import 'package:quizzz/home/home_state.dart';
import 'package:quizzz/shared/models/answer_model.dart';
import 'package:quizzz/shared/models/question_model.dart';
import 'package:quizzz/shared/models/quiz_model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  List<QuizModel>? quizzes;

  void getQuizzes() {
    quizzes = [
      QuizModel(title: "Quiz 1", questions: [
        QuestionModel(title: "A resposta é opcao 4",
          answers: [
            AnswerModel(title: "Opcao 1"),
            AnswerModel(title: "Opcao 2"),
            AnswerModel(title: "Opcao 3"),
            AnswerModel(title: "Opcao 4", isCorrect: true),
          ]
        )
      ])
    ];
  }
}
