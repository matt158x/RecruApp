import '../../domain/usecases/find_outlier.dart';
import '../../core/utils/input_parser.dart';


class InputController {
  final FindOutlier _findOutlier;

  InputController(this._findOutlier);

  int process(String rawInput) {
    final numbers = parseNumbers(rawInput);
    return _findOutlier.execute(numbers);
  }

  int forceProcess(String rawInput) {
    final numbers = parseNumbers(rawInput);
    return _findOutlier.execute(
      numbers,
      allowMultipleOutliers: true,
    );
  }

  List<int> parseOnly(String rawInput) {
    return parseNumbers(rawInput);
  }
}