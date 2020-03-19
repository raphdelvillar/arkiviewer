import 'package:flutter/material.dart';
import '../../utils/audio.dart' as audio;

class CorrectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    audio.play('correct');
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 125),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text("Correct!", style: TextStyle(fontSize:  30, fontWeight: FontWeight.bold, color: Colors.black))
              )
            ]
          ),
          alignment: FractionalOffset(0.5, 0.5)
        ),
      )
      )
      
    );
  }
}