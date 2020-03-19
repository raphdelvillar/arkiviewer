import 'package:flutter/material.dart';
import '../../utils/audio.dart' as audio;

class SkipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    audio.play('skipped');
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
              Icon(Icons.skip_next, color: Colors.grey, size: 125),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text("Skipped!", style: TextStyle(fontSize:  30, fontWeight: FontWeight.bold, color: Colors.black))
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