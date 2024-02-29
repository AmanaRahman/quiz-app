//  import 'dart:convert';

// import 'package:flutter/services.dart';
// import 'package:flutter_application_3/models/quiz_model.dart';

// Future<void> loadJson() async {
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