import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main (){
  runApp(MaterialApp(
    home: Quizzler(),
  ));
}

class Quizzler extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizzlerWidget(),
        ),
      ),
    );
  }
}

class QuizzlerWidget extends StatefulWidget {
  @override
  _QuizzlerWidgetState createState() {
    return _QuizzlerWidgetState();
  }
}
  class _QuizzlerWidgetState extends State<QuizzlerWidget>{
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = new QuizBrain();
  int right = 0;
  int wrong = 0;
  @override
  Widget build(BuildContext context){
    return Column(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     crossAxisAlignment: CrossAxisAlignment.stretch,
     children: [
       Expanded(
         flex: 5,
         child: Padding(
           padding: const EdgeInsets.all(10.0),
             child: Center(child: Text(quizBrain.getQuestionText(),
             textAlign: TextAlign.center,
             style: TextStyle(
               color: Colors.white,
               fontSize: 25.0,
             ),)),
           ),
         ),
       Expanded(
         child: Padding(
           padding: const EdgeInsets.all(15.0),
           child: TextButton(
             style: TextButton.styleFrom(
               backgroundColor: Colors.green,
             ),
             child: Center(child: Text('True',
             style: TextStyle(
               color: Colors.white,
               fontSize: 20.0,
             ),)),
             onPressed: (){
                 checkToAnswer(true);
             },
           ),
         ),
       ),
       Expanded(
         child: Padding(
           padding: const EdgeInsets.all(15.0),
           child: TextButton(
             style: TextButton.styleFrom(
               backgroundColor: Colors.red,
             ),
             child: Center(
               child: Text('False',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
               ),),
             ),
             onPressed:(){
                 checkToAnswer(false);
             },
           ),
         ),
       ),
       Row(
         children:
           scoreKeeper,

       ),
     ],
   );
   }
   void checkToAnswer(bool index){
    setState((){
      if (quizBrain.getNumberQuestion() == quizBrain.getBankLength()){
        Alert(context: context, title: 'right - $right, wrong - $wrong',).show();
        quizBrain.setNumberQuestion();
        scoreKeeper.clear();

      } else if(quizBrain.getAnswer() == index){
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
      right++;
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
      wrong++;

    }

    quizBrain.nextQuestion();
    });}
  }



