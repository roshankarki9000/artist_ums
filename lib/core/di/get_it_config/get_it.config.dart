// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_links/app_links.dart' as _i327;
import 'package:artist_ums/core/api/api_client.dart' as _i75;
import 'package:artist_ums/core/api/auth_client.dart' as _i779;
import 'package:artist_ums/core/app_router.dart' as _i518;
import 'package:artist_ums/core/constants/key_constants.dart' as _i893;
import 'package:artist_ums/core/di/get_it_config/registered_modules.dart'
    as _i349;
import 'package:artist_ums/core/presentation/widgets/connectivity/bloc/connectivity_bloc.dart'
    as _i882;
import 'package:artist_ums/core/presentation/widgets/connectivity/data/repository/connectivity_repo_impl.dart'
    as _i379;
import 'package:artist_ums/core/presentation/widgets/connectivity/domain/repository/connectivity_repo.dart'
    as _i178;
import 'package:artist_ums/core/presentation/widgets/connectivity/service/connectivity_monitor.dart'
    as _i356;
import 'package:artist_ums/core/service/deep_link_service.dart' as _i994;
import 'package:artist_ums/core/service/email_service.dart' as _i1027;
import 'package:artist_ums/core/utils/connectivity_service.dart' as _i392;
import 'package:artist_ums/core/utils/repository_guard.dart' as _i566;
import 'package:artist_ums/core/utils/retry_manager.dart' as _i388;
import 'package:artist_ums/features/auth/data/repository/auth_repo_impl.dart'
    as _i813;
import 'package:artist_ums/features/auth/domain/repository/auth_repository.dart'
    as _i977;
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart'
    as _i681;
import 'package:artist_ums/features/users/data/repository/user_repo_impl.dart'
    as _i141;
import 'package:artist_ums/features/users/domain/repository/user_repository.dart'
    as _i231;
import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart'
    as _i690;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i518.AppRouter>(() => _i518.AppRouter());
    gh.lazySingleton<_i893.KeyConstants>(() => _i893.KeyConstants());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => registerModule.internetChecker,
    );
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i327.AppLinks>(() => registerModule.appLinks);
    gh.lazySingleton<_i356.ConnectionMonitor>(
      () => _i356.ConnectionMonitor(
        gh<_i895.Connectivity>(),
        gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.lazySingleton<_i392.ConnectivityService>(
      () => _i392.ConnectivityService(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i994.DeepLinkService>(
      () => registerModule.deepLinkService(gh<_i327.AppLinks>()),
    );
    gh.lazySingleton<_i388.RetryManager>(
      () => _i388.RetryManager(gh<_i392.ConnectivityService>()),
    );
    gh.lazySingleton<_i75.ApiClient>(
      () => registerModule.apiClient(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i779.AuthClient>(
      () => registerModule.authClient(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i178.ConnectivityRepository>(
      () => _i379.ConnectivityRepositoryImpl(gh<_i356.ConnectionMonitor>()),
    );
    gh.lazySingleton<_i566.RepositoryGuard>(
      () => registerModule.repositoryGuard(
        gh<_i392.ConnectivityService>(),
        gh<_i388.RetryManager>(),
      ),
    );
    gh.factory<_i882.ConnectivityBloc>(
      () => _i882.ConnectivityBloc(gh<_i178.ConnectivityRepository>()),
    );
    gh.lazySingleton<_i1027.EmailService>(
      () => registerModule.emailService(gh<_i566.RepositoryGuard>()),
    );
    gh.lazySingleton<_i231.UserRepository>(
      () => _i141.UserRepositoryImpl(
        gh<_i75.ApiClient>(),
        gh<_i566.RepositoryGuard>(),
        gh<_i779.AuthClient>(),
      ),
    );
    gh.lazySingleton<_i977.AuthRepository>(
      () => _i813.AuthRepositoryImpl(
        gh<_i779.AuthClient>(),
        gh<_i566.RepositoryGuard>(),
        gh<_i231.UserRepository>(),
      ),
    );
    gh.factory<_i690.UserBloc>(
      () => _i690.UserBloc(gh<_i231.UserRepository>()),
    );
    gh.factory<_i681.AuthBloc>(
      () => _i681.AuthBloc(
        gh<_i977.AuthRepository>(),
        gh<_i231.UserRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i349.RegisterModule {}
