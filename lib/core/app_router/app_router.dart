import 'package:artist_ums/core/app_router/app_routes.dart';
import 'package:artist_ums/core/app_router/go_router_refresh_stream.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter createRouter(AuthBloc authBloc) {
    return GoRouter(
      initialLocation: const SplashRoute().location,
      routes: $appRoutes,

      refreshListenable: GoRouterRefreshStream(authBloc.stream),

      redirect: (context, state) {
        final authState = authBloc.state;

        final splashPath = const SplashRoute().location;
        final loginPath = const LoginRoute().location;
        final registerPath = const RegisterRoute().location;
        final resetPath = const ResetPasswordRoute().location;
        final dashboardPath = const DashboardRoute().location;

        final currentPath = state.uri.path;

        return authState.when(
          initial: () => splashPath,

          loading: () => null,

          unauthenticated: () {
            if (currentPath == loginPath || currentPath == registerPath) {
              return null;
            }
            return loginPath;
          },

          resetRequired: () {
            if (currentPath == resetPath) return null;
            return resetPath;
          },

          authenticated: (user) {
            if (currentPath == loginPath ||
                currentPath == registerPath ||
                currentPath == resetPath ||
                currentPath == splashPath) {
              return dashboardPath;
            }
            return null;
          },

          error: (_) {
            return loginPath;
          },
        );
      },
    );
  }
}
