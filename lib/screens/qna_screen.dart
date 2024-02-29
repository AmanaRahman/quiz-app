import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/models/quiz_model.dart';
import 'package:flutter_application_3/screens/quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Timer timer;
  int timerSeconds = 10;
  bool showLinearProgress = true;

  List<int> selectedAnswerIndices = List.filled(4, -1);
  int correctAnswerIndex = -1;
  int currentQuestionIndex = 0;
  List<QuizModel> questions = [];

  @override
  void initState() {
    super.initState();
    loadJson();
    startTimer();
  }

  void loadJson() async {
    try {
      String data = await rootBundle.loadString('assets/quiz.json');
      print('JSON Data: $data');
      Map<String, dynamic> jsonResult = json.decode(data);
      print('Decoded JSON Result: $jsonResult');

      if (jsonResult.containsKey('questions')) {
        setState(() {
          questions = List<QuizModel>.from(
              jsonResult['questions'].map((json) => QuizModel.fromJson(json)));
        });
      }
    } catch (e, stackTrace) {
      print('Error loading JSON: $e');
      print('Stack trace: $stackTrace');
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--;
        } else {

        }
      });
    });
  }

  Widget buildOption(int optionIndex) {
    bool isCorrect = correctAnswerIndex == optionIndex;
    bool isSelected =
        selectedAnswerIndices[currentQuestionIndex] == optionIndex;

    Color buttonColor =
        isSelected ? (isCorrect ? Colors.green : Colors.red) : Colors.grey;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedAnswerIndices[currentQuestionIndex] = optionIndex;
            correctAnswerIndex = questions[currentQuestionIndex]
                .options
                .indexOf(questions[currentQuestionIndex].correctAnswer!);
            timerSeconds = 10;
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey;
            } else {
              return buttonColor;
            }
          }),
        ),
        child: Text(
          questions.isNotEmpty &&
                  questions[currentQuestionIndex].options != null
              ? questions[currentQuestionIndex].options[optionIndex]
              : 'Option $optionIndex',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void goToNextQuestion() {
    if (timer.isActive) {
      timer.cancel();
    }

    if (selectedAnswerIndices[currentQuestionIndex] != -1) {
      setState(() {
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          selectedAnswerIndices = List.filled(4, -1);
          correctAnswerIndex = -1;
          timerSeconds = 10;
          showLinearProgress = true;
          startTimer();
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizResultScreen()),
          );
        }
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: buildQuestionPage(),
    );
  }

  Widget buildQuestionPage() {
    return Container(
      color: Color.fromARGB(255, 33, 0, 38),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showLinearProgress)
              Column(
                children: [
                  LinearProgressIndicator(
                    minHeight: 30,
                    value: timerSeconds / 10,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ],
              ),
            SizedBox(height: 10),
            Text(
              questions.isNotEmpty
                  ? questions[currentQuestionIndex].question!
                  : 'Loading...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            if (questions.isNotEmpty &&
                questions[currentQuestionIndex].options != null)
              ...List.generate(4, (i) => buildOption(i)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: goToNextQuestion,
              child: Text('Next Question'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }
}
