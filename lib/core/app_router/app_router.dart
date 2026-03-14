import 'package:artist_ums/core/app_router/app_routes.dart';
import 'package:artist_ums/core/app_router/go_router_refresh_stream.dart';
import 'package:artist_ums/core/utils/extensions/log_extension.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter createRouter(AuthBloc authBloc) {
    return GoRouter(
      initialLocation: const SplashRoute().location,
      routes: $appRoutes,
      onException: (context, state, router) {
        final error = state.error;
        if (error != null) {
          error.logError(type: 'GoRouter Exception');
        } else {
          'Unknown GoRouter error at ${state.uri}'.logError(
            type: 'GoRouter Exception',
          );
        }
      },

      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        try {
          final authState = authBloc.state;

          final splashPath = const SplashRoute().location;
          final loginPath = const LoginRoute().location;
          final registerPath = const RegisterRoute().location;
          final resetPath = const ResetPasswordRoute().location;
          final dashboardPath = const DashboardRoute().location;

          final currentPath = state.uri.path;
          if (currentPath == '/') {
            return splashPath;
          }
          return authState.when(
            initial: () {
              return splashPath;
            },

            loading: () {
              return null;
            },

            unauthenticated: () {
              if (currentPath == loginPath || currentPath == registerPath) {
                return null;
              }
              return loginPath;
            },

            resetRequired: () {
              if (currentPath == resetPath) {
                return null;
              }
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
        } catch (e, stack) {
          e.logError(type: 'GoRouter Redirect');
          stack.logError(type: 'GoRouter Redirect Stack');

          return const LoginRoute().location;
        }
      },
    );
  }
}
