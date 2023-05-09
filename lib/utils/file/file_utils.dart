import 'dart:io';

import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/permission/permission_utils.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

class FileUtils {
  String rootDir = '/storage/emulated/0/Android/media';

   Future<String?> getLogFilePath(String fileName) async {
    if (DeviceUtils.isMobile()) {
      final String logPath = await getExternalLogPath();
      return '$logPath/$fileName.txt';
    }
    return null;
  }

   Future<String> getExternalLogPath() async {
    final Directory _dir = (await _getRootDirectory())!;
    final String dirPath = '${_dir.path}/logs';
    await _checkAndCreateDirectory(dirPath);
    return dirPath;
  }

   Future<Directory?> _getRootDirectory() async {
    final PermissionResult result =
        await PermissionsUtils().requestSdCardPermission();
    if (result == PermissionResult.granted) {
      return await _getAppMediaDir();
    } else {
      return await getTemporaryDirectory();
    }
  }

   Future<void> _checkAndCreateDirectory(String dirPath) async {
    if (!Directory(dirPath).existsSync()) {
      await Directory(dirPath).create(recursive: true);
    }
  }

   Future<Directory?> _getAppMediaDir() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final String appPackage = packageInfo.packageName;
    final String appName = packageInfo.appName;
    final String appMediaDirPath = '$rootDir/$appPackage/$appName';

    return Directory(appMediaDirPath);
  }
}
