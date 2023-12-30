import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late DateTime currentTime;
  late DateTime futureTime;
  late Duration timeDifference;

  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();
    futureTime =
        currentTime.add(Duration(minutes: 30)); // Set your future time here
    timeDifference = futureTime.difference(currentTime);

    // Update time every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
        timeDifference = futureTime.difference(currentTime);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedCurrentTime = DateFormat.Hms().format(currentTime);
    String formattedFutureTime = DateFormat.Hms().format(futureTime);
    String formattedTimeDifference =
        "${timeDifference.inHours}:${(timeDifference.inMinutes % 60).toString().padLeft(2, '0')}:${(timeDifference.inSeconds % 60).toString().padLeft(2, '0')}";

    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Time: $formattedCurrentTime',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Future Time: $formattedFutureTime',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Time Difference: $formattedTimeDifference',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
