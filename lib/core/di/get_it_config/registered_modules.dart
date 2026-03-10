import 'package:app_links/app_links.dart';
import 'package:artist_ums/core/api/api_client.dart';
import 'package:artist_ums/core/api/auth_client.dart';
import 'package:artist_ums/core/service/deep_link_service.dart';
import 'package:artist_ums/core/service/email_service.dart';
import 'package:artist_ums/core/utils/connectivity_service.dart';
import 'package:artist_ums/core/utils/repository_guard.dart';
import 'package:artist_ums/core/utils/retry_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  InternetConnectionChecker get internetChecker => InternetConnectionChecker();
  @lazySingleton
  Connectivity get connectivity => Connectivity();
  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;
  @lazySingleton
  ApiClient apiClient(SupabaseClient client) => ApiClient(client: client);
  @lazySingleton
  AuthClient authClient(SupabaseClient client) => AuthClient(client: client);
  @lazySingleton
  RepositoryGuard repositoryGuard(
    ConnectivityService connectivityService,
    RetryManager retryManager,
  ) => RepositoryGuard(connectivityService, retryManager);

  @lazySingleton
  EmailService emailService(RepositoryGuard guard) {
    const brevoKey = String.fromEnvironment('BREVO_API_KEY');
    if (brevoKey.isEmpty) {
      throw Exception('BREVO_API_KEY is not defined');
    }
    return EmailService(guard, brevoKey);
  }

  @lazySingleton
  AppLinks get appLinks => AppLinks();

  /// Deep link service
  @lazySingleton
  DeepLinkService deepLinkService(AppLinks appLinks) =>
      DeepLinkService(appLinks);
}
