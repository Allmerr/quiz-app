class QuizQuestion {
  const QuizQuestion(this.qustion, this.answers);

  final String qustion;
  final List<String> answers;

  List<String> getShuffledList() {
    final List<String> shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
