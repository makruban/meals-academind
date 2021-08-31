class Question{
  String _questionText;
  bool _answer;

  Question(String questionText, bool answer){
    this._questionText = questionText;
    this._answer = answer;
  }

  String getQuestionText(){
    return this._questionText;
  }
  bool getAnswer(){
    return this._answer;
  }

}