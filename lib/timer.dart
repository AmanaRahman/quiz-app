// import 'dart:async';

// import 'package:flutter/material.dart';

// class TimerWidget extends StatefulWidget {
//   @override
//   _TimerWidgetState createState() => _TimerWidgetState();
// }

// class _TimerWidgetState extends State<TimerWidget> {
//   int _seconds = 0;
//   Timer? _timer;

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         _seconds++;
//       });
//     });
//   }

//   void stopTimer() {
//     _timer?.cancel();
//     _seconds = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'Timer: $_seconds seconds',
//           style: TextStyle(fontSize: 24),
//         ),
//         SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: startTimer,
//               child: Text('Start'),
//             ),
//             SizedBox(width: 16),
//             ElevatedButton(
//               onPressed: stopTimer,
//               child: Text('Stop'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }