import 'package:quizzz/shared/models/answer_model.dart';

class QuizController {
  AnswerModel? selectedAnswer;
  List<AnswerModel> answeredQuestions = [];
  int correctAnswers = 0;
  bool hasAnswered = false; // Controla se a pergunta atual já foi respondida
  bool? isCurrentAnswerCorrect; // Indica se a resposta atual está correta

  double get result => answeredQuestions.isEmpty ? 0 : (correctAnswers / answeredQuestions.length) * 100;
  
  void answerQuestion(AnswerModel answer) {
    if (!hasAnswered) {
      selectedAnswer = answer;
      hasAnswered = true;
      isCurrentAnswerCorrect = answer.isRight;
      
      if (answer.isRight) {
        correctAnswers++;
      }
    }
  }
  
  void nextQuestion() {
    if (selectedAnswer != null) {
      answeredQuestions.add(selectedAnswer!);
    }
    
    // Resetar para a próxima pergunta
    selectedAnswer = null;
    hasAnswered = false;
    isCurrentAnswerCorrect = null;
  }
}