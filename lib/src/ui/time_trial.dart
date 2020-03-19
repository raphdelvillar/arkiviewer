import 'package:flutter/material.dart';

import '../utils/csv.dart' as csv;

import './widgets/countdown.dart';
import './widgets/choice_selection.dart';
import './feedbacks/correct.dart';
import './feedbacks/incorrect.dart';
import './feedbacks/skip.dart';

class TimeTrialScreen extends StatefulWidget {
  final Map<String, Map<String, String>> template;

  TimeTrialScreen({Key key, this.template}) : super(key: key);

  @override
  _TimeTrialScreenState createState() => _TimeTrialScreenState();
}

class _TimeTrialScreenState extends State<TimeTrialScreen> {
  int progress = 1;
  int initialTime = 10;
  int start;
  Map<String, Map<String, String>> noLimitTemplate = Map<String, Map<String,String>>();

  @override
  void initState() {
    super.initState();
    noLimitTemplate = widget.template;
    start = initialTime;
  }

  _navigate(int index) {
    Map<String, String> feedback = noLimitTemplate[progress.toString()];
    if (index == 1) {
      if (feedback["Answer"] == feedback["Correct Answer"]) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CorrectScreen()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => IncorrectScreen()));
      }
    } else {
      feedback["Answer"] = "";
      feedback["Skip"] = "true";
      Navigator.push(context, MaterialPageRoute(builder: (context) => SkipScreen()));
    }

    setState(() => progress++);
    countdownKey.currentState.reset();
  }

  _onAnswer(String answer) {
    noLimitTemplate[progress.toString()]["Answer"] = answer;
    setState(() => noLimitTemplate = noLimitTemplate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.av_timer, color: Colors.grey,),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text('Time Trial Quiz', style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey))
                ),
              ]
            ),
            Countdown(key: countdownKey, start: start, navigate: _navigate)
          ]
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(35, 0, 25, 0),
        child: ListView(
          children: _getQuestionnaire(context)
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.skip_next, color: Colors.red), title: Text('Skip', style: TextStyle(color: Colors.red))),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigate_next, color: Colors.green), title: Text('Next', style: TextStyle(color: Colors.green))
          ),
        ],
        onTap: (index) {
          _navigate(index);
        }
      ),
    );
  }

  List<Widget> _getQuestionnaire(BuildContext context) {
    List<Widget> pre = [];
    pre.add(Divider());
    pre.add(
      Padding(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: Text('Question ' + progress.toString() + '/' + noLimitTemplate['Subject']['Length'], style: TextStyle(fontSize:  16), textAlign: TextAlign.left)
      )
    );
    pre.add(
      Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 25),
        child: Text(noLimitTemplate[progress.toString()]['Question'], style: TextStyle(fontSize:  16, fontWeight: FontWeight.bold), textAlign: TextAlign.center)
      ) 
    );

    pre.add(Divider());
    List<Widget> compiled = pre + _getChoices();

    return compiled;
  }

  List<Widget> _getChoices() {
    List<Widget> choices = [];

    Map<String, String> query = noLimitTemplate[progress.toString()];

    int i = 1;
    while(query.containsKey(csv.numberToLetter[i.toString()])) {
      Widget icon = Icon(Icons.radio_button_unchecked, color: Colors.grey);

      if (query["Answer"] == csv.numberToLetter[i.toString()]) {
        icon = Icon(Icons.check_circle_outline, color: Colors.green);
      }

      choices.add(
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
          child: ChoiceSelection(icon: icon, query: query, index: i, onAnswer: _onAnswer)
        )
      );

      choices.add(Divider());
      i++;
    }

    return choices;
  }
}