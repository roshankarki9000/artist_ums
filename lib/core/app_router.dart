import 'package:artist_ums/features/artists/presentation/screens/artists_page.dart';
import 'package:artist_ums/features/artists/presentation/screens/create_artist_page.dart';
import 'package:artist_ums/features/artists/presentation/screens/edit_artist_page.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:artist_ums/features/auth/presentation/screens/login_page.dart';
import 'package:artist_ums/features/auth/presentation/screens/register_page.dart';
import 'package:artist_ums/features/auth/presentation/screens/reset_password_page.dart';
import 'package:artist_ums/features/auth/presentation/screens/splash_page.dart';
import 'package:artist_ums/features/dashboard/presentation/screens/dashboard_page.dart';
import 'package:artist_ums/features/songs/presentation/screens/create_song_page.dart';
import 'package:artist_ums/features/songs/presentation/screens/edit_song_page.dart';
import 'package:artist_ums/features/songs/presentation/screens/songs_page.dart';
import 'package:artist_ums/features/users/presentation/screens/create_user_page.dart';
import 'package:artist_ums/features/users/presentation/screens/edit_user_page.dart';
import 'package:artist_ums/features/users/presentation/screens/users_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppRouter {
  GoRouter createRouter() {
    final router = GoRouter(
      initialLocation: '/splash',
      redirect: (context, state) {
        final authState = context.read<AuthBloc>().state;
        final location = state.matchedLocation;

        return authState.maybeWhen(
          authenticated: (user) {
            return '/dashboard';
          },

          unauthenticated: () {
            if (location == '/login' || location == '/register') {
              return null;
            }
            return '/login';
          },

          resetRequired: () {
            if (location != '/reset-password') {
              return '/reset-password';
            }
            return null;
          },

          loading: () => null,
          initial: () => null,
          error: (_) => '/login',

          orElse: () => null,
        );
      },
      routes: [
        /// ROOT
        GoRoute(path: '/', redirect: (_, _) => '/splash'),

        /// SPLASH
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashPage(),
        ),

        /// AUTH
        GoRoute(path: '/login', builder: (context, state) => LoginPage()),

        GoRoute(path: '/register', builder: (context, state) => RegisterPage()),

        GoRoute(
          path: '/reset-password',
          builder: (context, state) => ResetPasswordPage(),
        ),

        /// DASHBOARD
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardPage(),
        ),

        /// USERS
        GoRoute(
          path: '/users',
          builder: (context, state) => const UsersPage(),
          routes: [
            GoRoute(
              path: 'create-user',
              builder: (context, state) => const CreateUserPage(),
            ),
            GoRoute(
              path: 'edit-user/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return EditUserPage(id: id);
              },
            ),
          ],
        ),

        /// ARTISTS
        GoRoute(
          path: '/artists',
          builder: (context, state) => const ArtistsPage(),
          routes: [
            GoRoute(
              path: 'create-artist',
              builder: (context, state) => const CreateArtistPage(),
            ),
            GoRoute(
              path: 'edit-artist/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return EditArtistPage(id: id);
              },
            ),

            /// SONGS OF SPECIFIC ARTIST
            GoRoute(
              path: ':artistId/songs',
              builder: (context, state) {
                final artistId = state.pathParameters['artistId']!;
                return SongsPage(id: artistId);
              },
            ),
          ],
        ),

        /// SONGS (GLOBAL)
        GoRoute(
          path: '/songs',
          builder: (context, state) => const SongsPage(),
          routes: [
            GoRoute(
              path: 'create-song',
              builder: (context, state) =>
                  CreateSongPage(id: state.pathParameters['id']!),
            ),
            GoRoute(
              path: 'edit-song/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return EditSongPage(id: id);
              },
            ),
          ],
        ),
      ],
    );
    return router;
  }
}
