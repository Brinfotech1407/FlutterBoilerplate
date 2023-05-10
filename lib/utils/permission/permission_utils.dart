import 'package:permission_handler/permission_handler.dart';

enum PermissionResult {
  undetermined,
  granted,
  denied,
  restricted,
  permanentlyDenied,
}

class PermissionsUtils {
  Future<PermissionResult> _requestPermission(Permission permission) async {
    final PermissionStatus result = await permission.request();
    return PermissionResult.values[result.index];
  }

  Future<PermissionResult> requestImagesPermission() async {
    return _requestPermission(Permission.storage);
  }

  Future<PermissionResult> requestMicroPhonePermission() async {
    return _requestPermission(Permission.microphone);
  }

  Future<PermissionResult> requestSdCardPermission() async {
    return _requestPermission(Permission.storage);
  }

  Future<PermissionResult> requestLocationPermission() async {
    return _requestPermission(Permission.location);
  }

  Future<bool> openSettings() async => await openAppSettings();

  Future<Map<Permission, PermissionStatus>> checkForAppPermission() async {
    /*if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }*/

// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.contacts,
    ].request();

    return statuses;
  }

  Future<Map<Permission, PermissionStatus>> requestForAppPermission() async {
    /*if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }*/

// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.contacts,
      Permission.microphone,
      Permission.camera,
    ].request();

    return statuses;
  }

  Future<bool> permissionForMicAndCamera() async {
    final Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    bool isPermissionGiven = true;

    for (PermissionStatus status in statuses.values) {
      isPermissionGiven = isPermissionGiven && status.isGranted;
    }

    return isPermissionGiven;
  }
}
