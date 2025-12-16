import 'find_outlier.dart';

import '../errors/outlier_errors.dart';
import '../errors/multiple_outliers_error.dart';

class FindOutlierUseCase implements FindOutlier {
  @override
  int execute(
      List<int> numbers, {
        bool allowMultipleOutliers = false,
      }) {
    if (numbers.length < 3) {
      throw ArgumentError('Array must contain at least 3 numbers');
    }

    final evens = numbers.where((n) => n.isEven).toList();
    final odds = numbers.where((n) => n.isOdd).toList();

    if (evens.isEmpty) {
      throw NoEvenNumberError();
    }

    if (odds.isEmpty) {
      throw NoOddNumberError();
    }

    if (!allowMultipleOutliers && evens.length > 1 && odds.length > 1) {
      final typeToFix =
      evens.length > odds.length ? OutlierType.odd : OutlierType.even;
      throw MultipleOutliersError(typeToFix);
    }

    final evenCount = numbers.take(3).where((n) => n.isEven).length;
    final majorityIsEven = evenCount >= 2;

    for (final n in numbers) {
      if (majorityIsEven && n.isOdd) return n;
      if (!majorityIsEven && n.isEven) return n;
    }

    throw StateError('No outlier found');
  }
}