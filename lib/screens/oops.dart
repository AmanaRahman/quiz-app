import 'package:flutter/material.dart';

class Oops extends StatelessWidget {
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
                'assets/50.png',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                ),
                child: Text('Try again!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
