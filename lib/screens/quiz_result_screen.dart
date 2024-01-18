import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Color.fromARGB(255, 33, 0, 38),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/90.png',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('Back!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
