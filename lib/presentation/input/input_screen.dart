import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/errors/multiple_outliers_error.dart';
import 'input_controller.dart';
import '../../domain/usecases/find_outlier_usecase.dart';
import '../../domain/usecases/auto_fix_outliers_usecase.dart';
import '../../domain/errors/outlier_errors.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late final InputController _controller;
  late final AutoFixOutliersUseCase _autoFixUseCase;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = InputController(FindOutlierUseCase());
    _autoFixUseCase = AutoFixOutliersUseCase();
  }

  void _onSearch() {
    try {
      final result = _controller.process(_textController.text);

      context.push(
        '/result',
        extra: result,
      );
    } on MultipleOutliersError catch (e) {
      _showDecisionDialog(e);
    } on NoOddNumberError catch (e) {
      _showError(e.message);
    } on NoEvenNumberError catch (e) {
      _showError(e.message);
    } on FormatException {
      _showError('Nieprawidłowy format danych wejściowych');
    } catch (_) {
      _showError('Wystąpił nieoczekiwany błąd');
    }
  }

  void _showDecisionDialog(MultipleOutliersError error) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Uwaga'),
        content: Text(
          '${error.message}. Czy chcesz kontynuować?',
        ),
        actions: [
          TextButton(
            child: const Text('Popraw automatycznie'),
            onPressed: () {
              Navigator.pop(context);
              _autoFix(error.type);
            },
          ),
          TextButton(
            child: const Text('Popraw manualnie'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('Kontynuuj mimo to'),
            onPressed: () {
              Navigator.pop(context);
              _forceContinue();
            },
          ),
        ],
      ),
    );
  }

  void _autoFix(OutlierType type) {
    try {
      final numbers = _controller.parseOnly(_textController.text);
      final fixed = _autoFixUseCase.execute(numbers, type);

      _textController.text = fixed.join(',');
    } catch (_) {
      _showError('Nie udało się poprawić danych');
    }
  }

  void _forceContinue() {
    try {
      final result = _controller.forceProcess(_textController.text);

      context.push(
        '/result',
        extra: result,
      );
    } catch (_) {
      _showError('Nie udało się kontynuować');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wykrywacz Liczby Odstającej')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Podaj liczby po przecinku',
                hintText: '2,4,0,100,4,11,2602,36',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onSearch,
              child: const Text('Wyszukaj'),
            ),
          ],
        ),
      ),
    );
  }
}
