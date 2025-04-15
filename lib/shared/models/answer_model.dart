class AnswerModel {
  final String title;
  final bool isRight;

  AnswerModel({
    required this.title,
    this.isRight = false,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      title: json['answer'] as String,
      isRight: json['isCorrect'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': title,
      'isRight': isRight,
    };
  }
}