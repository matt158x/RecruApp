class NoOddNumberError implements Exception {
  final String message;

  NoOddNumberError([
    this.message = 'Nie została wprowadzona żadna liczba nieparzysta',
  ]);

  @override
  String toString() => message;
}

class NoEvenNumberError implements Exception {
  final String message;

  NoEvenNumberError([
    this.message = 'Nie została wprowadzona żadna liczba parzysta',
  ]);

  @override
  String toString() => message;
}
