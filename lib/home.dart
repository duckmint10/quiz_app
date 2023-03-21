import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions.dart';

class QuizApp extends StatefulWidget {
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currenQuestionindex = 0;
  List questions = [
    Question("Tưởng tượng là một việc an toàn?", false),
    Question(
        "Các em đã chết rất lâu rồi, từ những môn học trước.\nVà các em thối rữa, bốc mùi kinh khủng ở môn học của tôi?",
        true),
    Question("Cô Hân thích cây Trầu bà?", true),
    Question("Cô Hân có khầu hiệu là Big10?", false),
  ];

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questions[_currenQuestionindex].isCorrect) {
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text("Correct"),
        backgroundColor: Colors.lightGreen,
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _nextQuestion();
    } else {
      debugPrint("Incorrect");
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text("Incorrect"),
        backgroundColor: Colors.red.shade400,
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _nextQuestion();
    }
  }

  _nextQuestion() {
    setState(() {
      _currenQuestionindex = (_currenQuestionindex + 1) % questions.length;
    });
  }
  _prevQuestion(){
    setState(() {
      _currenQuestionindex = (_currenQuestionindex - 1) % questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CNDPT",
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
        //backgroundColor: Colors.indigo.shade500,
      ),
      //backgroundColor: Colors.indigo.shade500,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/flag.jpeg",
                  width: 250,
                  height: 180,
                  color: Colors.yellow,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.yellow.shade800,
                          style: BorderStyle.solid)),
                  height: 150,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      questions.elementAt(_currenQuestionindex).content,
                      //style: TextStyle(fontSize: 18, color: Colors.yellow.shade100),
                    ),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                        onPressed: () => _prevQuestion(),
                        color: Colors.yellow.shade100,
                        child: Icon(Icons.arrow_back,
                            color: Colors.indigo.shade500)),
                    RaisedButton(
                      onPressed: () => _checkAnswer(true, context),
                      color: Colors.yellow.shade100,
                      child: Text(
                        "TRUE",
                        style: TextStyle(color: Colors.indigo.shade500),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(false, context),
                      color: Colors.yellow.shade100,
                      child: Text(
                        "FALSE",
                        style: TextStyle(color: Colors.indigo.shade500),
                      ),
                    ),
                    RaisedButton(
                        onPressed: () => _nextQuestion(),
                        color: Colors.yellow.shade100,
                        child: Icon(Icons.arrow_forward,
                            color: Colors.indigo.shade500))
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
