class Question {
  String question;
  bool answer;
  String explanation;
  String imagePath;
  
  Question(String question, bool answer, String explanation, String imagePath) {
    this.question = question;
    this.answer = answer;
    this.explanation = explanation;
    this.imagePath = imagePath;
  }
}