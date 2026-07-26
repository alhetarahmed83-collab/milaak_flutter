import 'package:go_router/go_router.dart';

import 'startup_gate.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const StartupGate()),
  ],
);
