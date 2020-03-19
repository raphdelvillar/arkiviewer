import 'package:flutter/material.dart';

import '../utils/csv.dart' as csv;

class StudyScreen extends StatefulWidget {
  final Map<String, Map<String, String>> template;

  StudyScreen({Key key, this.template}) : super(key: key);

  @override
  _StudyScreenState createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  int progress = 1;

  @override
  void initState() {
    super.initState();
  }

  _navigate(int index) {
    if (index == 1) {
      setState(() => progress++);
    } else {
      if (progress > 1) {
        setState(() => progress--);
      }
    }
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
          children: [
            Icon(Icons.school, color: Colors.grey,),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text('Study', style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey))
            )
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
          BottomNavigationBarItem(icon: Icon(Icons.navigate_before, color: Colors.grey), title: Text('Back', style: TextStyle(color: Colors.grey))),
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
        child: Text('Question ' + progress.toString() + '/' + widget.template['Subject']['Length'], style: TextStyle(fontSize:  16), textAlign: TextAlign.left)
      )
    );
    pre.add(
      Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 25),
        child: Text(widget.template[progress.toString()]['Question'], style: TextStyle(fontSize:  16, fontWeight: FontWeight.bold), textAlign: TextAlign.center)
      ) 
    );

    pre.add(Divider());
    List<Widget> compiled = pre + _getChoices();

    return compiled;
  }

  List<Widget> _getChoices() {
    List<Widget> choices = [];

    Map<String, String> query = widget.template[progress.toString()];

    int i = 1;
    while(query.containsKey(csv.numberToLetter[i.toString()])) {
      Widget icon = Icon(Icons.radio_button_unchecked, color: Colors.grey);
      if (query["Correct Answer"] == csv.numberToLetter[i.toString()]) {
        icon = Icon(Icons.check_circle, color: Colors.green);
      }

      choices.add(
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                icon,
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Text(
                      query[csv.numberToLetter[i.toString()]].trimRight(), 
                      style: TextStyle(fontSize:  14), textAlign: TextAlign.left
                    )
                  )
                )
              ]
            )
          )
        )
      );

      choices.add(Divider());
      i++;
    }

    return choices;
  }
}