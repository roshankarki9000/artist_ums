import 'package:artist_ums/core/utils/extensions/log_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthClient {
  final SupabaseClient _client;

  AuthClient({required SupabaseClient client}) : _client = client;

  Session? get session => _client.auth.currentSession;
  User? get currentUser => _client.auth.currentUser;

  Future<AuthResponse> setSession(String token) {
    return _client.auth.setSession(token);
  }

  /// LOGIN
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    "AUTH REQUEST → login | email:$email".logApi(type: "AuthClient");

    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    "AUTH RESPONSE ← ${response.user?.id}".logApi(type: "AuthClient");

    return response;
  }

  /// REGISTER
  Future<AuthResponse> register({
    required String email,
    required String password,
    Map<String, dynamic>? data,
  }) async {
    "AUTH REQUEST → register | email:$email".logApi(type: "AuthClient");

    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: data,
    );

    "AUTH RESPONSE ← ${response.user?.id}".logApi(type: "AuthClient");

    return response;
  }

  /// GOOGLE LOGIN
  Future<void> loginWithGoogle() async {
    "AUTH REQUEST → google login".logApi(type: "AuthClient");

    await _client.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'io.supabase.flutter://auth-callback',
    );
  }

  /// LOGOUT
  Future<void> logout() async {
    "AUTH REQUEST → logout".logApi(type: "AuthClient");

    await _client.auth.signOut();
  }

  /// RESET PASSWORD
  Future<void> updatePassword({required String password}) async {
    "AUTH REQUEST → update password".logApi(type: "AuthClient");

    await _client.auth.updateUser(UserAttributes(password: password));
  }

  /// SESSION CHECK
  bool hasSession() {
    return _client.auth.currentSession != null;
  }
}
