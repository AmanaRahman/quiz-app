class QuizModel {
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? correctAnswer;

  QuizModel({
    this.question,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.correctAnswer,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        question: json["question"],
        option1: json["option1"],
        option2: json["option2"],
        option3: json["option3"],
        option4: json["option4"],
        correctAnswer: json["correctAnswer"],
      );

  List<String> get options => [option1!, option2!, option3!, option4!];

  Map<String, dynamic> toJson() => {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4,
        "correctAnswer": correctAnswer,
      };
}
