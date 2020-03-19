import 'package:flutter/material.dart';
import 'dart:async';

class Countup extends StatefulWidget {

  Countup({Key key}): super(key: key);

  @override
  _CountupState createState() => _CountupState();
}

class _CountupState extends State<Countup> {
  Timer timer;
  int cu = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  _startTimer() {
    const duration = const Duration(seconds: 1);
    timer = Timer.periodic(
      duration,
      (Timer timer) => 
      setState(() {
        cu++;
      }) 
    );
  }

  String _setDisplay() {
    Duration elapsedTime = Duration(seconds: cu);
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(elapsedTime.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(elapsedTime.inSeconds.remainder(60));
    return "${twoDigits(elapsedTime.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.timer, color: Colors.grey),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(_setDisplay(), style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey))
        )
      ]
    );
  }
}