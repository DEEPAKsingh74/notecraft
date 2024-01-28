import 'package:flutter/services.dart';

class StatusBarUtil {
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}
