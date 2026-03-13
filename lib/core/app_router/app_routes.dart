// lib/core/app_router/app_routes.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Screens
import 'package:artist_ums/features/auth/presentation/screens/login_page.dart';
import 'package:artist_ums/features/auth/presentation/screens/register_page.dart';
import 'package:artist_ums/features/auth/presentation/screens/reset_password_page.dart';
import 'package:artist_ums/features/auth/presentation/screens/splash_page.dart';
import 'package:artist_ums/features/dashboard/presentation/screens/dashboard_page.dart';
import 'package:artist_ums/features/users/presentation/screens/users_page.dart';
import 'package:artist_ums/features/users/presentation/screens/create_user_page.dart';
import 'package:artist_ums/features/users/presentation/screens/edit_user_page.dart';
import 'package:artist_ums/features/artists/presentation/screens/artists_page.dart';
import 'package:artist_ums/features/artists/presentation/screens/create_artist_page.dart';
import 'package:artist_ums/features/artists/presentation/screens/edit_artist_page.dart';
import 'package:artist_ums/features/songs/presentation/screens/songs_page.dart';
import 'package:artist_ums/features/songs/presentation/screens/create_song_page.dart';
import 'package:artist_ums/features/songs/presentation/screens/edit_song_page.dart';
import 'package:artist_ums/features/profile/presentation/screens/profile_page.dart';
import 'package:artist_ums/features/profile/presentation/screens/edit_profile_page.dart';

part 'app_routes.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => LoginPage();
}

@TypedGoRoute<RegisterRoute>(path: '/register')
class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => RegisterPage();
}

@TypedGoRoute<ResetPasswordRoute>(path: '/reset-password')
class ResetPasswordRoute extends GoRouteData with $ResetPasswordRoute {
  const ResetPasswordRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ResetPasswordPage();
}

@TypedGoRoute<DashboardRoute>(path: '/dashboard')
class DashboardRoute extends GoRouteData with $DashboardRoute {
  const DashboardRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DashboardPage();
}

@TypedGoRoute<UsersRoute>(
  path: '/users',
  routes: [
    TypedGoRoute<CreateUserRoute>(path: 'create-user'),
    TypedGoRoute<EditUserRoute>(path: 'edit-user/:id'),
  ],
)
class UsersRoute extends GoRouteData with $UsersRoute {
  const UsersRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const UsersPage();
}

class CreateUserRoute extends GoRouteData with $CreateUserRoute {
  const CreateUserRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CreateUserPage();
}

class EditUserRoute extends GoRouteData with $EditUserRoute {
  final String id;
  const EditUserRoute({required this.id});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditUserPage(id: id);
}

@TypedGoRoute<ArtistsRoute>(
  path: '/artists',
  routes: [
    TypedGoRoute<CreateArtistRoute>(path: 'create-artist'),
    TypedGoRoute<EditArtistRoute>(path: 'edit-artist/:id'),
    TypedGoRoute<ArtistSongsRoute>(path: ':artistId/songs'),
  ],
)
class ArtistsRoute extends GoRouteData with $ArtistsRoute {
  const ArtistsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ArtistsPage();
}

class CreateArtistRoute extends GoRouteData with $CreateArtistRoute {
  const CreateArtistRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CreateArtistPage();
}

class EditArtistRoute extends GoRouteData with $EditArtistRoute {
  final String id;
  const EditArtistRoute({required this.id});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditArtistPage(id: id);
}

class ArtistSongsRoute extends GoRouteData with $ArtistSongsRoute {
  final String artistId;
  const ArtistSongsRoute({required this.artistId});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SongsPage(id: artistId);
}

@TypedGoRoute<SongsRoute>(
  path: '/songs',
  routes: [
    TypedGoRoute<CreateSongRoute>(path: 'create-song'),
    TypedGoRoute<EditSongRoute>(path: 'edit-song/:id'),
  ],
)
class SongsRoute extends GoRouteData with $SongsRoute {
  const SongsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const SongsPage();
}

class CreateSongRoute extends GoRouteData with $CreateSongRoute {
  final String? id;
  const CreateSongRoute({this.id});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CreateSongPage(id: id);
}

class EditSongRoute extends GoRouteData with $EditSongRoute {
  final String id;
  const EditSongRoute({required this.id});
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditSongPage(id: id);
}

@TypedGoRoute<ProfileRoute>(
  path: '/profile',
  routes: [TypedGoRoute<EditProfileRoute>(path: 'edit')],
)
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfilePage();
}

class EditProfileRoute extends GoRouteData with $EditProfileRoute {
  const EditProfileRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => EditProfilePage();
}
