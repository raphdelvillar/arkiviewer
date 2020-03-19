import 'package:flutter/material.dart';

import './no_limit.dart';
import './time_trial.dart';
import './speed_run.dart';
import './study.dart';

class ActionScreen extends StatefulWidget {
  final Map<String, Map<String, String>> template;

  ActionScreen({Key key, this.template}) : super(key: key);

  @override
  _ActionScreenState createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.template != null) {
      return loaded(context);
    }
    return Container();
  }

  Widget loaded(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
          child: Text(widget.template['Subject']['Title'], style: TextStyle(fontSize:  20, fontWeight: FontWeight.bold), textAlign: TextAlign.left)
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
          child: Text(widget.template['Subject']['Subtitle'], style: TextStyle(fontSize:  15), textAlign: TextAlign.left)
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 15, 25, 25),
          child: Text(widget.template['Subject']['Length'] + ' questions', style: TextStyle(fontSize:  15), textAlign: TextAlign.left)
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
          child: Text("How would you like to review?", style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold), textAlign: TextAlign.left)
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
          child: Material(
            elevation: 2,
            color: Colors.black,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 1.25,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NoLimitScreen(template: widget.template)));
              },
              child: Text("No Limit Quiz", style: TextStyle(color: Colors.white))
            )
          )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 5, 25, 25),
          child: Material(
            elevation: 2,
            color: Colors.black,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 1.25,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TimeTrialScreen(template: widget.template)));
              },
              child: Text("Time Trial Quiz", style: TextStyle(color: Colors.white))
            )
          )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 5, 25, 25),
          child: Material(
            elevation: 2,
            color: Colors.black,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 1.25,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SpeedRunScreen(template: widget.template)));
              },
              child: Text("Speed Run Quiz", style: TextStyle(color: Colors.white))
            )
          )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 5, 25, 25),
          child: Material(
            elevation: 2,
            color: Colors.black,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 1.25,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StudyScreen(template: widget.template)));
              },
              child: Text("Study", style: TextStyle(color: Colors.white))
            )
          )
        ),
      ]
    );
  }
}