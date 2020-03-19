import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  void initState() {
    super.initState();
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
            Icon(Icons.info, color: Colors.grey,),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text('About', style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey))
            )
          ]
        ),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset('assets/images/arkimetrics.png')
                  ),
                  backgroundColor: Colors.yellow,
                  radius: 50.0
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text('Rebyu v.1.0', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 35, 25, 25),
                child: Text("Rebyu is a quiz application made to assist new architects with their licensure examination",
                  style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text('The People behind the application', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset('assets/images/alberto.jpg')
                  ),
                  radius: 50.0
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text('Alberto Gonzales', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text('Chief Executive Officer', style: TextStyle(fontSize: 13), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 35, 25, 25),
                child: Text("Alberto is the CEO of Arkimetrics - a design and consultancy firm that he and his wife Anna Gee established in 2014. Although people view him as a strict and serious person he does let out his comedic side sometimes. Currently a member of the United Architects of the Philippines - Barasoian Chapter.",
                  style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,
                )
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset('assets/images/anna_gee.jpg')
                  ),
                  radius: 50.0
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text('Anna Gee', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text('Chief Executive Officer', style: TextStyle(fontSize: 14), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 35, 25, 25),
                child: Text("Anna Gee breathes positivity. A community-driven, passionate architect and an expert at doing her job she loves doing what she does best and that is to live life to the fullest. She is the wife of Alberto Gonzales and is currently a member of the United Architects of the Philippines - Barasoian Chapter.",
                  style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,
                )
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset('assets/images/raph.jpg')
                  ),
                  radius: 50.0
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text('Raph Wilson Del Villar', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text('Senior Software Engineer', style: TextStyle(fontSize: 13), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 35, 25, 25),
                child: Text("Raph is a passionate, self-driven software engineer that boasts of having more than 7 years of experience in the IT industry. Raph loves innovations and challenges and are attracted to solving real customer problems by combining IT solutions and business knowledge expertise. You can view more of his project at http://raphdelvillar.github.io.",
                  style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,
                )
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset('assets/images/chean.jpg')
                  ),
                  radius: 50.0
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text('Rachel Anne Del Villar', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text('UX/UI Quality Assurance', style: TextStyle(fontSize: 13), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 35, 25, 25),
                child: Text("Rachel loves anything that has to do with technology and design. She loves to meticulously design experiences, big to small, digital to analogue with moments of delight. Although a beginner at the IT space she is eager to learn and grow professionally.",
                  style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset('assets/images/michelle.jpg')
                  ),
                  radius: 50.0
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text('Michelle Anne Marquez', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text('Digital Graphic Designer', style: TextStyle(fontSize: 13), textAlign: TextAlign.center,)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 35, 25, 25),
                child: Text("Michelle breathes creativity and it shows through her sense of style and fashion. She does not limit herself to just graphic design as she loves to make music, video editing and making 3-D art models. A graphic designer eager to show the world what she is made of.",
                  style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,
                )
              ),
              Divider()
            ]
          )
        )
      )
    );
  }
}