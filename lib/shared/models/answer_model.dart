class AnswerModel {
  final String answer;
  final bool isCorrect;

  AnswerModel({
    required this.answer,
    this.isCorrect = false,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      answer: json['answer'] as String,
      isCorrect: json['isCorrect'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }
}