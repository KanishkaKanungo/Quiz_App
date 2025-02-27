class QuizQuestion {
  const QuizQuestion(this.text, this.options);

  final String text;
  final List<String> options;
  List<String> shuffleList() {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
