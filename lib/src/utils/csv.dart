import 'dart:async';

import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

Map<String, String> numberToLetter = {
  '1': 'A',
  '2': 'B',
  '3': 'C',
  '4': 'D',
  '5': 'E',
  '6': 'F',
  '7': 'G'
};

Future<String> loadRootBundle(String path) async {
  return await rootBundle.loadString(path);
}

Future<List<List<dynamic>>> load(String path) async {
  String data = await loadRootBundle(path);
  List<List<dynamic>> row = const CsvToListConverter().convert(data);
  return row;
}

// load all file collection --
Map<String, List<String>> getFiles() {
  Map<String, List<String>> collection = {
    "Architecture": [
      "EPR - Ultimate v.1.0",
      "EPR - Area 1",
      "EPR - Area 2",
      "EPR - Area 3",
      "EPR - AICP",
      "EPR - Practice Questions",
      "EPR - Planning Law Administration",
      "EPR - Economic Planning",
      "EPR - Environmental Laws",
      "EPR - Land Use Planning",
      "EPR - Social Planning",
      "EPR - Special Planning Studies",
      "EPR - Philippine Environmental Laws",
      "EPR - Planning, Concepts, Theories, History",
      "EPR - Planning Laws Implementation & Land Use Planning",
      "EPR - Capability Bldg Course",
      "EPR - Quiz 1",
      "EPR - Quiz 2",
      "EPR - Quiz 3",
      "EPR - Quiz 4",
      "EPR - 2nd Mock Exam",
      "EPR - 3rd Mock Exam"
    ]
  };


  return collection;
}


// read csv file from assets folder --
Future<Map<String, Map<String, String>>> getData(String filename) async {
  List<List<dynamic>> data = await load('assets/reviewer/$filename.csv');

  Map<String, Map<String, String>> collection = {
    'Subject': {
      'Title': data[1][1],
      'Subtitle': data[2][1],
      'Length': (data.length - 3).toString()
    }
  };

  for(int i = 3; i < data.length; i++) {
    List<String> query = data[i][1].split(RegExp(', [a-z]\. '));

    Map<String, String> qd = {
      'Question': query[0].trim(),
      'Answer': "",
      'Skip': "false"
    };

    for (int a = 1; a < query.length; a++) {
      qd[numberToLetter[a.toString()]] = query[a];
    }

    qd['Correct Answer'] = data[i][2];

    collection[(i - 2).toString()] = qd;
  }


  return collection;
}