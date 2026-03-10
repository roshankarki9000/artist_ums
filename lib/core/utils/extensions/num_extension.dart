extension NumberFormatExtension on num {
  String get twoDigits {
    return toString().padLeft(2, '0');
  }
}
