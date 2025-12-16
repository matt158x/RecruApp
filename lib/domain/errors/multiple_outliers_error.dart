enum OutlierType {
  even,
  odd,
}

class MultipleOutliersError implements Exception {
  final OutlierType type;

  MultipleOutliersError(this.type);

  String get message {
    switch (type) {
      case OutlierType.even:
        return 'Wprowadzono więcej niż jedną liczbę parzystą';
      case OutlierType.odd:
        return 'Wprowadzono więcej niż jedną liczbę nieparzystą';
    }
  }
}
