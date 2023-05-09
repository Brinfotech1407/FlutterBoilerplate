import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart' as l;

// will log in debug modes but not in release modes
class ProductionFilter extends l.LogFilter {
  @override
  bool shouldLog(l.LogEvent event) {
    bool shouldLog = false;
    assert(() {
      shouldLog = true;
      return shouldLog;
    }());
    return shouldLog;
  }
}

// will always log
class DevelopmentFilter extends l.LogFilter {
  @override
  bool shouldLog(l.LogEvent event) {
    return true;
  }
}

enum LoggerMode { console, file, consoleAndFile }

class AppLogger {
  AppLogger({
    String? tag,
    this.logFilePath,
    this.filter,
    this.loggerMode = LoggerMode.console,
  })  : assert(
          () {
            if (loggerMode != LoggerMode.console) {
              return logFilePath != null;
            }
            return true;
          }(),
          'If log mode specifies any mode with file logging, filePath is mandatory',
        ),
        tag = tag ?? 'AppLogger' {
    _logger = l.Logger(
      printer: _PrettyPrinter(printTime: true, methodCount: 3),
      filter: filter ?? ProductionFilter(),
      output: FileOutput(
        file: logFilePath != null ? File(logFilePath!) : null,
        loggerMode: loggerMode,
      ),
    );
  }

  final String tag;
  final String? logFilePath;
  final LoggerMode loggerMode;

  final l.LogFilter? filter;
  late l.Logger _logger;

  void d(dynamic log) {
    _logger.d('D/$tag : $log');
  }

  void i(dynamic log) {
    _logger.i('I/$tag : $log');
  }

  void w(dynamic log) {
    print(
      'W/$tag Warning ========================================================',
    );
    _logger.w(log);
    print(
      '=======================================================================',
    );
  }

  void e(dynamic log) {
    print('E/$tag ----------------------Error----------------------');
    _logger.e(log);
    print('---------------------------------------------------------');
  }
}

class _PrettyPrinter extends l.PrettyPrinter {
  _PrettyPrinter({
    int methodCount = 2,
    int errorMethodCount = 8,
    int lineLength = 120,
    bool colors = true,
    bool printEmojis = true,
    bool printTime = false,
  }) : super(
          methodCount: methodCount,
          errorMethodCount: errorMethodCount,
          lineLength: lineLength,
          colors: colors,
          printEmojis: printEmojis,
          printTime: printTime,
        );

  String get _date {
    final DateTime now = DateTime.now();
    return '${now.day}-${now.month}-${now.year}';
  }

  @override
  String getTime(DateTime time) {
    return '$_date ${super.getTime(time)}';
  }
}

class FileOutput extends l.ConsoleOutput {
  FileOutput({
    this.file,
    this.loggerMode = LoggerMode.console,
    this.overrideExisting = false,
    this.encoding = utf8,
  }) : assert(loggerMode != null);

  final File? file;
  final bool overrideExisting;
  final Encoding encoding;
  final LoggerMode loggerMode;
  IOSink? _sink;

  @override
  void init() {
    _sink = file?.openWrite(
      mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
      encoding: encoding,
    );
  }

  @override
  void output(l.OutputEvent event) {
    if (loggerMode == LoggerMode.consoleAndFile) {
      _writeToFile(event);
      super.output(event);
    } else if (loggerMode == LoggerMode.file) {
      _writeToFile(event);
    } else if (loggerMode == LoggerMode.console) {
      super.output(event);
    }
  }

  void _writeToFile(l.OutputEvent event) {
    _sink?.writeAll(
        event.lines.map<String>(
          // strip ansi colors
          (String e) => e.replaceAll(RegExp(r'\x1b\[[0-9;]*m'), ''),
        ),
        '\n');
    _sink?.write('\n');
  }

  @override
  Future<void> destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}
