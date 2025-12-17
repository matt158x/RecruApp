import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../common/gradient_background.dart';


class ResultScreen extends StatelessWidget {
  final int result;

  const ResultScreen({
    super.key,
    required this.result
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () => context.pop(),
                    ),
                  ),
                  const Text(
                    'Znaleziona cyfra:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                result.toString(),
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 56,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}