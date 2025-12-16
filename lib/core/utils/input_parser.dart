List<int> parseNumbers(String input) {
  return input
      .split(',')
      .map((e) => int.parse(e.trim()))
      .toList();
}