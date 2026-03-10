import 'dart:developer' as d;

extension LogExtension on Object? {
  void log({String? type}) =>
      d.log('\x1B[33m [${type ?? 'Log'}] ${this?.toString()}\x1B[0m');

  void logError({String? type}) =>
      d.log('\x1B[31m [${type ?? 'Error'}] ${this?.toString()}\x1B[0m');

  void logApi({String? type}) =>
      d.log('\x1B[32m [ ${type ?? 'ApiClient'} ] ${this?.toString()}\x1B[0m');
}
