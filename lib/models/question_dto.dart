class QuestionDto {
  final String question;
  final List<String> answers;

  const QuestionDto(this.question, this.answers);

  List<String> get shuffledAnswer {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
