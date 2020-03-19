import 'package:flutter/material.dart';

import '../../utils/csv.dart' as csv;

class ChoiceSelection extends StatefulWidget {
  final Widget icon;
  final Map<String, String> query;
  final int index;
  final dynamic onAnswer;

  ChoiceSelection({Key key, this.icon, this.query, this.index, this.onAnswer}) : super(key: key);

  @override
  _ChoiceSelectionState createState() => _ChoiceSelectionState();
}

class _ChoiceSelectionState extends State<ChoiceSelection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
      child: InkWell(
        onTap: () {
          widget.onAnswer(csv.numberToLetter[widget.index.toString()]);
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              widget.icon,
              Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Text(
                    widget.query[csv.numberToLetter[widget.index.toString()]].trimRight(),
                    style: TextStyle(fontSize: 14), textAlign: TextAlign.left,
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}