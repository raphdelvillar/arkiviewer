import 'package:flutter/material.dart';

import '../utils/csv.dart' as csv;

import './about.dart';
import './action_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, Map<String, String>> selectedTemplate;
  Map<String, List<String>> templates;

  @override
  void initState() {
    super.initState();
    templates = csv.getFiles();
  }

  _loadTemplate(BuildContext context, Future<Map<String, Map<String, String>>> future) {
    future.then((Map<String, Map<String, String>> value) {
      setState(() => selectedTemplate = value);
      Navigator.of(context).pop();
    }).catchError((error) {
      print(error);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        title: Text("Arkiviewer v.1.0", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                  Icons.settings
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
              },
              child: Icon(
                  Icons.info
              ),
            )
          ),
        ]
      ),
      drawer: Drawer(
        child: ListView(
          children: _getBody()
        )
      ),
      body: ActionScreen(template : selectedTemplate)
    );
  }

  List<Widget> _getBody() {
    List<Widget> pre = [];
    pre.add(
      Padding(
              padding: EdgeInsets.fromLTRB(15, 25, 0, 10),
              child: Text("Select Template", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
      )
    );
    pre.add(Divider());

    List<Widget> compiled = pre + _getArchitecture();

    return compiled;
  }

  List<Widget> _getArchitecture() {
    return List.generate(templates["Architecture"].length, (int index) {
      String name = templates["Architecture"][index];
      return ListTile(
        title: Text(name, style: TextStyle(fontSize: 12, color: Colors.black)),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          _loadTemplate(context, csv.getData(name));
        }
      );
    });
  }
}