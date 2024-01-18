import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/quiz_screen.dart';



class QuizHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Color.fromARGB(255, 33, 0, 38),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/quiz.png',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 140, // Set your desired width here
                height: 50, // Set the height to make it square
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(182, 82, 200, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Set border radius to 0 for a square shape
                    ),
                  ),
                  child: Text(
                    'Start Quiz',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}