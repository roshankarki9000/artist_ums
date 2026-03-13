import 'package:artist_ums/core/app_router/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRouter {
  GoRouter createRouter() {
    return GoRouter(
      initialLocation: const SplashRoute().location,
      routes: $appRoutes,

      redirect: (context, state) {
        final session = Supabase.instance.client.auth.currentSession;
        final loggedIn = session != null;

        final loggingIn =
            state.uri.path == const LoginRoute().location ||
            state.uri.path == const RegisterRoute().location ||
            state.uri.path == const ResetPasswordRoute().location;

        // Not logged in → go to login
        if (!loggedIn && !loggingIn) {
          return const LoginRoute().location;
        }

        // Logged in → prevent login/register
        if (loggedIn && loggingIn) {
          return const DashboardRoute().location;
        }

        return null;
      },
    );
  }
}
