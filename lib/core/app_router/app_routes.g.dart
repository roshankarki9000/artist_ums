// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashRoute,
  $loginRoute,
  $registerRoute,
  $resetPasswordRoute,
  $dashboardRoute,
  $usersRoute,
  $artistsRoute,
  $songsRoute,
  $profileRoute,
];

RouteBase get $splashRoute =>
    GoRouteData.$route(path: '/splash', factory: $SplashRoute._fromState);

mixin $SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  @override
  String get location => GoRouteData.$location('/splash');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute =>
    GoRouteData.$route(path: '/login', factory: $LoginRoute._fromState);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute =>
    GoRouteData.$route(path: '/register', factory: $RegisterRoute._fromState);

mixin $RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  @override
  String get location => GoRouteData.$location('/register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $resetPasswordRoute => GoRouteData.$route(
  path: '/reset-password',
  factory: $ResetPasswordRoute._fromState,
);

mixin $ResetPasswordRoute on GoRouteData {
  static ResetPasswordRoute _fromState(GoRouterState state) =>
      const ResetPasswordRoute();

  @override
  String get location => GoRouteData.$location('/reset-password');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dashboardRoute =>
    GoRouteData.$route(path: '/dashboard', factory: $DashboardRoute._fromState);

mixin $DashboardRoute on GoRouteData {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  @override
  String get location => GoRouteData.$location('/dashboard');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $usersRoute => GoRouteData.$route(
  path: '/users',
  factory: $UsersRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'create-user',
      factory: $CreateUserRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'edit-user/:id',
      factory: $EditUserRoute._fromState,
    ),
  ],
);

mixin $UsersRoute on GoRouteData {
  static UsersRoute _fromState(GoRouterState state) => const UsersRoute();

  @override
  String get location => GoRouteData.$location('/users');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateUserRoute on GoRouteData {
  static CreateUserRoute _fromState(GoRouterState state) =>
      const CreateUserRoute();

  @override
  String get location => GoRouteData.$location('/users/create-user');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EditUserRoute on GoRouteData {
  static EditUserRoute _fromState(GoRouterState state) =>
      EditUserRoute(id: state.pathParameters['id']!);

  EditUserRoute get _self => this as EditUserRoute;

  @override
  String get location => GoRouteData.$location(
    '/users/edit-user/${Uri.encodeComponent(_self.id)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $artistsRoute => GoRouteData.$route(
  path: '/artists',
  factory: $ArtistsRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'create-artist',
      factory: $CreateArtistRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'edit-artist/:id',
      factory: $EditArtistRoute._fromState,
    ),
    GoRouteData.$route(
      path: ':artistId/songs',
      factory: $ArtistSongsRoute._fromState,
    ),
  ],
);

mixin $ArtistsRoute on GoRouteData {
  static ArtistsRoute _fromState(GoRouterState state) => const ArtistsRoute();

  @override
  String get location => GoRouteData.$location('/artists');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateArtistRoute on GoRouteData {
  static CreateArtistRoute _fromState(GoRouterState state) =>
      const CreateArtistRoute();

  @override
  String get location => GoRouteData.$location('/artists/create-artist');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EditArtistRoute on GoRouteData {
  static EditArtistRoute _fromState(GoRouterState state) =>
      EditArtistRoute(id: state.pathParameters['id']!);

  EditArtistRoute get _self => this as EditArtistRoute;

  @override
  String get location => GoRouteData.$location(
    '/artists/edit-artist/${Uri.encodeComponent(_self.id)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ArtistSongsRoute on GoRouteData {
  static ArtistSongsRoute _fromState(GoRouterState state) =>
      ArtistSongsRoute(artistId: state.pathParameters['artistId']!);

  ArtistSongsRoute get _self => this as ArtistSongsRoute;

  @override
  String get location => GoRouteData.$location(
    '/artists/${Uri.encodeComponent(_self.artistId)}/songs',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $songsRoute => GoRouteData.$route(
  path: '/songs',
  factory: $SongsRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'create-song',
      factory: $CreateSongRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'edit-song/:id',
      factory: $EditSongRoute._fromState,
    ),
  ],
);

mixin $SongsRoute on GoRouteData {
  static SongsRoute _fromState(GoRouterState state) => const SongsRoute();

  @override
  String get location => GoRouteData.$location('/songs');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateSongRoute on GoRouteData {
  static CreateSongRoute _fromState(GoRouterState state) =>
      CreateSongRoute(id: state.uri.queryParameters['id']);

  CreateSongRoute get _self => this as CreateSongRoute;

  @override
  String get location => GoRouteData.$location(
    '/songs/create-song',
    queryParams: {if (_self.id != null) 'id': _self.id},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EditSongRoute on GoRouteData {
  static EditSongRoute _fromState(GoRouterState state) =>
      EditSongRoute(id: state.pathParameters['id']!);

  EditSongRoute get _self => this as EditSongRoute;

  @override
  String get location => GoRouteData.$location(
    '/songs/edit-song/${Uri.encodeComponent(_self.id)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileRoute => GoRouteData.$route(
  path: '/profile',
  factory: $ProfileRoute._fromState,
  routes: [
    GoRouteData.$route(path: 'edit', factory: $EditProfileRoute._fromState),
  ],
);

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EditProfileRoute on GoRouteData {
  static EditProfileRoute _fromState(GoRouterState state) =>
      const EditProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile/edit');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
