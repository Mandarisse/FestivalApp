import 'package:go_router/go_router.dart';
import 'package:pauseguitare/screens/home_screen.dart';
import 'package:pauseguitare/screens/programmation_screen.dart';
import 'package:pauseguitare/screens/user_screen.dart';

class RouterService {
  GoRouter get() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: "home",
          pageBuilder: (context, state) =>
              NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/programmation',
          name: "programmation",
          pageBuilder: (context, state) =>
              NoTransitionPage(child: ProgrammationScreen()),
        ),
        GoRoute(
          path: '/user',
          name: 'user',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: UserScreen()),
        ),
      ],
    );
  }
}
