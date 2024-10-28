import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


  int getPlatformDevice()  {
  try {
    if (Platform.isAndroid) {
      return 1;
    } else if (Platform.isIOS) {
      return 2;
    } else if (Platform.isLinux) {
      return 3;
    }
    return 0;
  } on PlatformException {
    debugPrint('Failed to get platform version');
  }
  return 0;
}

Future<String?> getDeviceId() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String? deviceId;
  try {
    if (Platform.isAndroid) {
      var deviceData = await deviceInfoPlugin.androidInfo;
      deviceId = deviceData.id;
    } else if (Platform.isIOS) {
      var deviceData = await deviceInfoPlugin.iosInfo;
      deviceId = deviceData.identifierForVendor;
    } else if (Platform.isLinux) {
      var deviceData = await deviceInfoPlugin.linuxInfo;
      deviceId = deviceData.id;
    }
    return deviceId;
  } on PlatformException {
    debugPrint('Failed to get platform version');
  }
  return null;
}
