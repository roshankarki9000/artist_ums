import 'package:artist_ums/core/utils/extensions/log_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiClient {
  final SupabaseClient _client;
  final String? source;

  ApiClient({required SupabaseClient client, this.source}) : _client = client;

  String? get accessToken => _client.auth.currentSession?.accessToken;
  String? get refreshToken => _client.auth.currentSession?.refreshToken;

  /// Generic database request
  Future<dynamic> request({
    required String table,
    required RequestType type,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? rpcFunction,
    Map<String, dynamic>? rpcParams,
  }) async {
    "REQUEST → $type | table:$table | query:$query | body:$body".logApi(
      type: "ApiClient",
    );

    dynamic response;

    switch (type) {
      case RequestType.get:
        var req = _client.from(table).select();

        if (query != null) {
          query.forEach((key, value) {
            req = req.eq(key, value);
          });
        }

        response = await req;
        break;

      case RequestType.post:
        response = await _client.from(table).insert(body ?? {});
        break;

      case RequestType.patch:
        var req = _client.from(table).update(body ?? {});

        if (query != null) {
          query.forEach((key, value) {
            req = req.eq(key, value);
          });
        }

        response = await req;
        break;

      case RequestType.delete:
        var req = _client.from(table).delete();

        if (query != null) {
          query.forEach((key, value) {
            req = req.eq(key, value);
          });
        }

        response = await req;
        break;

      case RequestType.rpc:
        if (rpcFunction == null) {
          throw Exception("RPC function required");
        }

        response = await _client.rpc(rpcFunction, params: rpcParams ?? {});
        break;
    }

    "RESPONSE ← $response".logApi(type: "ApiClient");

    return response;
  }
}

enum RequestType { get, post, patch, delete, rpc }
