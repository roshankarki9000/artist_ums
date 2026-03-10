import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'failure.dart';

class FailureMapper {
  static Failure map(Object error) {
    if (error is AuthException) {
      return Failure.unauthorized(message: error.message);
    }
    if (error is AuthException) {
      return Failure.unauthorized(message: error.message);
    }

    if (error is SocketException) {
      return const Failure.network();
    }

    if (error is HttpException) {
      return const Failure.server();
    }

    if (error is FormatException) {
      return const Failure.server(message: "Invalid response format");
    }

    return Failure.unknown(message: error.toString());
  }
}
