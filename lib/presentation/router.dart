import 'package:go_router/go_router.dart';
import 'input/input_screen.dart';
import 'result/result_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'input',
      builder: (context, state) => const InputScreen(),
    ),
    GoRoute(
      path: '/result',
      name: 'result',
      builder: (context, state) {
        final result = state.extra as int;
        return ResultScreen(result: result);
      },
    ),
  ],
);