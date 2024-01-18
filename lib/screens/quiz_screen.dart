import 'dart:async';
import 'package:flutter/material.dart';
import 'quiz_result_screen.dart';
import 'oops.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Which planet in our system is known as the Red Planet?',
      'options': [
        '1. Alexander Flemming',
        '2. Alexander Graham Bell',
        '3. Thomas Alva Edison',
        '4. Mars',
      ],
      'correctAnswerIndex': 3,
    },
    // Add more questions as needed
  ];

  List<int> selectedAnswerIndices = List.filled(4, -1);
  int correctAnswerIndex = -1;
  int currentQuestionIndex = 0;
  Timer? blinkTimer;

  @override
  void dispose() {
    blinkTimer?.cancel();
    super.dispose();
  }

  void showCorrectAnswer() {
    setState(() {
      correctAnswerIndex = questions[currentQuestionIndex]['correctAnswerIndex'];
    });
    blinkTimer = Timer(Duration(milliseconds: 500), () {
      setState(() {
        correctAnswerIndex = -1;
      });
    });
  }

  void goToNextQuestion() {
    bool isCorrectAnswer =
        selectedAnswerIndices[currentQuestionIndex] == questions[currentQuestionIndex]['correctAnswerIndex'];

    if (isCorrectAnswer) {
      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswerIndices = List.filled(4, -1);
          correctAnswerIndex = -1;
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizResultScreen()),
        );
      }
    } else {
      showCorrectAnswer();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Oops()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 33, 0, 38),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              color: Color.fromARGB(255, 33, 0, 38),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        // Background Rounded Rectangle
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 132, 58, 144),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(20),
                        ),
                        // Foreground Rounded Rectangle
                        Positioned(
                          left: selectedAnswerIndices[index] == correctAnswerIndex
                              ? 0
                              : getLeftPosition(selectedAnswerIndices[index]), // Adjust the left position here
                          child: ClipRect(
                            // Add ClipRect to prevent overflow
                            child: Container(
                              width: 1000, 
                              decoration: BoxDecoration(
                                color: selectedAnswerIndices[index] == correctAnswerIndex
                                    ? Colors.purple 
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              questions[index]['question'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: List.generate(
                                4,
                                (optionIndex) {
                                  bool isCorrect =
                                      questions[index]['correctAnswerIndex'] == optionIndex;
                                  bool isSelected =
                                      selectedAnswerIndices[index] == optionIndex;
                                  bool showBlink = correctAnswerIndex == optionIndex;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedAnswerIndices[index] = optionIndex;
                                        if (!isCorrect) {
                                          showCorrectAnswer();
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? isCorrect
                                                ? Colors.green
                                                : Colors.red
                                            : showBlink
                                                ? Colors.green
                                                : Color.fromARGB(255, 33, 0, 38),
                                        borderRadius: BorderRadius.circular(18.0),
                                        border: Border.all(
                                          color: Color.fromARGB(255, 148, 148, 144),
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          questions[index]['options'][optionIndex],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: isSelected
                                                ? Colors.white
                                                : Color.fromARGB(255, 183, 178, 178),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Container(
                                width: 140,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    goToNextQuestion();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  double getLeftPosition(int selectedIndex) {
    // You can adjust this calculation based on your design
    return selectedIndex * 150;
  }
}
