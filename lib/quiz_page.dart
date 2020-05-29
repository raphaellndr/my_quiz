import 'package:flutter/material.dart';

import 'question.dart';
import 'custom_text.dart';

class QuizPage extends StatefulWidget {

  String title;

  QuizPage(String title) {
    this.title = title;
  }

  @override
  State<StatefulWidget> createState() => _QuizPage();

}

class _QuizPage extends State<QuizPage> {

  List<Question> questionsList = [
    Question('La devise de la Belgique est l\'union fait la force', true, '', 'assets/belgique.jpg'),
    Question('La lune va finir par tomber sur terre à cause de la gravité', false, 'Au contraire la lune s\'éloigne', 'assets/lune.jpg'),
    Question('La Russie est plus grande en superficie que Pluton', true, '', 'assets/russie.jpg'),
    Question('Nyctalope est une race naine d\'antilope', false, 'C’est une aptitude à voir dans le noir', 'assets/nyctalope.jpg'),
    Question('Le Commodore 64 est l\’oridnateur de bureau le plus vendu', true, '', 'assets/commodore.jpg'),
    Question('Le nom du drapeau des pirates es black skull', false, 'Il est appelé Jolly Roger', 'assets/pirate.png'),
    Question('Haddock est le nom du chien Tintin', false, 'C\'est Milou', 'assets/tintin.jpg'),
    Question('La barbe des pharaons était fausse', true, 'A l\'époque déjà ils utilisaient des postiches', 'assets/pharaon.jpg'),
    Question('Au Québec tire toi une bûche veut dire viens viens t\'asseoir', true, 'La bûche, fameuse chaise de bucheron', 'assets/buche.jpg'),
    Question('Le module lunaire Eagle de possédait de 4Ko de Ram', true, 'Dire que je me plains avec mes 8GO de ram sur mon mac', 'assets/eagle.jpg'),
  ];

  Question actualQuestion;
  int myScore = 0;
  int maxScore = 0;
  int index = 0;

  @override
  void initState() {
    super.initState();
    actualQuestion = questionsList[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomText('Question number ${index + 1}'),
            CustomText('Score : $myScore / $maxScore'),
            Card(
              elevation: 15.0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.height / 2,
                child: Image.asset(
                  actualQuestion.imagePath,
                  fit: BoxFit.cover,
                ),
              )
            ),
            CustomText(actualQuestion.question,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  elevation: 15.0,
                  onPressed: () {
                    correction(actualQuestion.answer == true ? 'Yes' : 'Wrong', actualQuestion.answer == true ? 'assets/vrai.jpg' : 'assets/faux.jpg');
                    if (actualQuestion.answer == true) {
                      setState(() {
                        myScore++;
                      });
                    }
                    setState(() {
                      maxScore++;
                    });
                  },
                  color: Colors.grey[800],
                  child: CustomText('True'),
                ),
                RaisedButton(
                  elevation: 15.0,
                  onPressed: () {
                    correction(actualQuestion.answer == false ? 'Yes' : 'Wrong', actualQuestion.answer == false ? 'assets/vrai.jpg' : 'assets/faux.jpg');
                    if (actualQuestion.answer == false) {
                      setState(() {
                        myScore++;
                      });
                    }
                    setState(() {
                      maxScore++;
                    });
                  },
                  color: Colors.grey[800],
                  child: CustomText('False'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }  

  Future<Null> correction(String response, String imagePath) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            response,
            textScaleFactor: 1.4,
            textAlign: TextAlign.center,
          ),
          children: <Widget>[
            Card(
              child: Container(
                child: Image.asset(imagePath, fit: BoxFit.contain,),
              ),
            ),
            Container(height: 20.0,),
            Text(actualQuestion.explanation, textScaleFactor: 1.5, textAlign: TextAlign.center,),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
                next();
              },
              color: Colors.grey[800],
              child: CustomText('Next'),
              textColor: Colors.white,
            )
          ]
        );
      }
    );
  }

  void next() {
    setState(() {
      if (index == questionsList.length - 1) {
        Navigator.pop(context);
      } else {
        index++;
      }
    });
    actualQuestion = questionsList[index];    
  }
}