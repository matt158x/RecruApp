import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.2, 1.0],
          colors: [
            Color(0xFF2ECC71),
            Color(0xFF2ECC71),
            Color(0xFF2B2B2B),
          ],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
