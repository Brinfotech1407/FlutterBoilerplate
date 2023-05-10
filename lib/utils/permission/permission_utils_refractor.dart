/*
import 'dart:html' as html;

import 'package:ok_done_utils/utils.dart';
import 'package:ok_done_utils/utils/platform_support/platform_utils.dart';
import 'package:permission_handler/permission_handler.dart';

enum PermissionResult {
  undetermined,
  granted,
  denied,
  restricted,
  permanentlyDenied,
}

//Todo(Ramu):needs to check this file's methods whether supporting web
class PermissionsUtils {
  Future<PermissionResult> _requestPermissionMobile(
      Permission permission) async {
    final PermissionStatus result = await permission.request();
    return PermissionResult.values[result.index];
  }

  Future<PermissionResult> _requestPermissionWeb(Permission permission) async {
    */
/**
     * Returning here for web currently , needs to figure out permission
     * request for other platforms.
     */ /*

    final html.PermissionStatus? pushPermission = await html
        .window.navigator.permissions
        ?.query(<dynamic, dynamic>{'name': 'microphone'});

    if (pushPermission != null) {
      if (pushPermission.state == 'denied') {
        return PermissionResult.denied;
      }
      if (pushPermission.state == 'granted') {
        return PermissionResult.granted;
      }
    }

    return PermissionResult.undetermined;
  }

  Future<PermissionResult> requestImagesPermission() async {
    return _requestPermissionMobile(Permission.storage);
  }

  Future<PermissionResult> requestMicroPhonePermission() async {
    return _requestPermissionMobile(Permission.microphone);
  }

  Future<PermissionResult> requestSdCardPermission() async {
    return _requestPermissionMobile(Permission.storage);
  }

  Future<PermissionResult> requestLocationPermission() async {
    if (PlatformUtils.isMobile) {
      return _requestPermissionMobile(Permission.location);
    } else if(PlatformUtils.isWeb){
      return _requestPermissionWeb(Permission.location);
    }
    return PermissionResult.undetermined;
  }

  Future<bool> openSettings() async => await openAppSettings();

  Future<Map<Permission, PermissionStatus>> checkForAppPermission() async {
    */
/*if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }*/ /*


// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.contacts,
    ].request();

    return statuses;
  }

  Future<Map<Permission, PermissionStatus>> requestForAppPermission() async {
    */
/*if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }*/ /*


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

    for (final PermissionStatus status in statuses.values) {
      isPermissionGiven = isPermissionGiven && status.isGranted;
    }

    return isPermissionGiven;
  }
}
*/
