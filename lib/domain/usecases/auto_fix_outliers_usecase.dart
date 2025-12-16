import '../errors/multiple_outliers_error.dart';

class AutoFixOutliersUseCase {
  List<int> execute(List<int> numbers, OutlierType typeToFix) {
    if (typeToFix == OutlierType.even) {
      final odds = numbers.where((n) => n.isOdd).toList();
      final firstEven = numbers.firstWhere((n) => n.isEven);
      return [...odds, firstEven];
    } else {
      final evens = numbers.where((n) => n.isEven).toList();
      final firstOdd = numbers.firstWhere((n) => n.isOdd);
      return [...evens, firstOdd];
    }
  }
}
