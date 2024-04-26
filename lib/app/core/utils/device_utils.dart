import 'package:daleel_store/app/core/utils/exports.dart';
import 'package:flutter/services.dart';

class DeviceUtils {
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isLargeDevices(BuildContext context) {
    if (screenWidth(context) > 390) {
      return true;
    }
    return false;
  }

  static bool isLandscapeOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static bool isPortraitOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static setAllOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
