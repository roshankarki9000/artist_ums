import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class KeyConstants {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}
