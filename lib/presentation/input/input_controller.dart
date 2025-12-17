import '../../domain/usecases/find_outlier.dart';
import '../../core/utils/input_parser.dart';
import '../../core/utils/input_normalizer.dart';


class InputController {
  final FindOutlier _findOutlier;

  InputController(this._findOutlier);

  int process(String rawInput) {
    final normalized = normalizeInput(rawInput);
    final numbers = parseNumbers(normalized);

    return _findOutlier.execute(numbers);
  }

  int forceProcess(String rawInput) {
    final normalized = normalizeInput(rawInput);
    final numbers = parseNumbers(normalized);

    return _findOutlier.execute(
      numbers,
      allowMultipleOutliers: true,
    );
  }

  List<int> parseOnly(String rawInput) {
    final normalized = normalizeInput(rawInput);
    return parseNumbers(normalized);
  }
}