// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_3/models/quiz_model.dart';
// import 'quiz_result_screen.dart';
// import 'oops.dart';

// class QuizScreen extends StatefulWidget {
//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   PageController pageController = PageController();
//   List<int> selectedAnswerIndices = List.filled(4, -1);
//   int correctAnswerIndex = -1;
//   int currentQuestionIndex = 0;
//   List<QuizModel> questions = [];

//   @override
//   void initState() {
//     super.initState();
//     loadJson();
//   }

//   Future<void> loadJson() async {
//     try {
//       String data = await rootBundle.loadString('assets/quiz.json');
//       print('JSON Data: $data');
//       Map<String, dynamic> jsonResult = json.decode(data);
//       print('Decoded JSON Result: $jsonResult');

//       if (jsonResult.containsKey('questions')) {
//         questions = List<QuizModel>.from(jsonResult['questions'].map((json) => QuizModel.fromJson(json)));
//       }
//     } catch (e, stackTrace) {
//       print('Error loading JSON: $e');
//       print('Stack trace: $stackTrace');
//     }
//   }

//   void goToNextQuestion() {
//     bool isCorrectAnswer = selectedAnswerIndices[currentQuestionIndex] == questions[currentQuestionIndex].options.indexOf(questions[currentQuestionIndex].correctAnswer!);

//     if (isCorrectAnswer) {
//       if (currentQuestionIndex < questions.length - 1) {
//         pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
//         setState(() {
//           currentQuestionIndex++;
//           selectedAnswerIndices = List.filled(4, -1);
//           correctAnswerIndex = -1;
//         });
//       } else {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => QuizResultScreen()),
//         );
//       }
//     } else {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Oops()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quiz App'),
//       ),
//       body: FutureBuilder(
//         future: loadJson(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return PageView.builder(
//               controller: pageController,
//               itemCount: questions.length,
//               itemBuilder: (context, index) {
//                 return buildQuestionPage(index);
//               },
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget buildQuestionPage(int index) {
//     return Container(
//       color: Color.fromARGB(255, 33, 0, 38),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               questions[index].question!,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(height: 10),
//             ...List.generate(4, (i) => buildOption(index, i)),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: goToNextQuestion,
//               child: Text('Next Question'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildOption(int questionIndex, int optionIndex) {
//     bool isCorrect = correctAnswerIndex == optionIndex;
//     bool isSelected = selectedAnswerIndices[questionIndex] == optionIndex;

//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 5),
//       child: ElevatedButton(
//         onPressed: () {
//           setState(() {
//             selectedAnswerIndices[questionIndex] = optionIndex;
//           });
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: isSelected
//               ? (isCorrect ? Colors.green : Colors.red)
//               : Colors.grey,
//         ),
//         child: Text(
//           questions[questionIndex].options[optionIndex],
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
