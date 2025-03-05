import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz()
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  // class variables
  int groupValue = 2;
  // currentQuestion is used to iterate the array/list
  int currentQuestion = 0;
  // questions[currentQuestion]
  // keep track of the score
  int score = 0;

  var questions = ['this is question 1', 'this is question 2', 'this is question 3'];
  var answers = [0,0,1];
  // display correct / incorrect
  String result = "";
   
  // class methods
  void checkAnswer(int answer) {

    print('User answered $answer');

    if(answers[currentQuestion] == answer) {
      print("Correct");
      score++;
      result = "Correct!";
    } else {
      print("Incorrect");
      result = "Incorrect!";
    }

    // if answer is true or false, set the score and show the result of correct/incorrect
    // set the groupValue 
    setState((){
      groupValue = answer; 
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, 
        title: Text("Quiz App")),
        backgroundColor: Colors.blue, //make the background blue
        body: Padding(
          padding: EdgeInsets.all(36.6),
          child: Column(
            children: <Widget>[
              Text(questions[currentQuestion], style: TextStyle(color: Colors.white)),
              Row(children: <Widget>[
                Radio(value: 1, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
                Text("True", style: TextStyle(color: Colors.white)),
                 Radio(value: 0, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
                Text("False", style: TextStyle(color: Colors.white)),
              ],),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              
              child: TextButton(onPressed: ()=>{ setState(() {
                currentQuestion++;
                groupValue = 2;
                result = "";
              })
              }, 
              child: Text("Next", style: TextStyle(color: Colors.white)),
              ),
              ),
              Container(  
                color: result == "Correct!" ? Colors.green : (result == "Incorrect!" ? Colors.red : Colors.transparent),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text (
                  result, 
                  style: TextStyle(color: Colors.white),
              ),
              ),
              Text("Score: $score", 
              style: TextStyle(
                fontSize: 36, 
                color: Colors.white
              )),
            ]
          ),),
    );
  }
}
