

import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/file/file_utils.dart';
import 'package:boilerplate/utils/logging/logger.dart';

mixin ApplicationLogger {
  static bool enableLoggerInReleaseMode = false;

  static AppLogger? _appLogger;
  static final FileUtils _fileUtils = FileUtils();

  static Future<void> init({String fileName = 'logs'}) async {
    _appLogger ??= AppLogger(
      logFilePath: await getLogFilePath(fileName),
      loggerMode: getLogMode(),
      tag: 'Foreground',
      filter: enableLoggerInReleaseMode == true
          ? DevelopmentFilter()
          : ProductionFilter(),
    );
  }

  static LoggerMode getLogMode() {
    if (DeviceUtils.isMobile()) {
      return LoggerMode.consoleAndFile;
    }
    return LoggerMode.console;
  }

  static Future<String?> getLogFilePath(String fileName) async {
    if (DeviceUtils.isMobile()) {
      final String logPath = await _fileUtils.getExternalLogPath();
      return '$logPath/$fileName.txt';
    }
    return null;
  }

  static AppLogger get _log {
    assert(_appLogger != null);
    return _appLogger!;
  }
}

extension LoggerUtil on Object {
  AppLogger get log => ApplicationLogger._log;
}
