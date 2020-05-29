import 'package:flutter/material.dart';

import 'quiz_page.dart';
import 'custom_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'My Quiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              elevation: 15.0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.height / 2,
                child: Image.asset(
                  'assets/cover.jpg',
                  fit: BoxFit.cover,
                ),
              )
            ),
            RaisedButton(
              onPressed: start,
              color: Colors.grey[800],
              child: CustomText('Start quiz')
            )
          ],
        ),
      ),
    );
  }

  void start() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return QuizPage('Quiz');
    }));
  }
}
