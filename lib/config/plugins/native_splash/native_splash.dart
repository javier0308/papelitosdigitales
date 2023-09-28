import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class NativeSplash {
  static Future<void> initializcionSplah() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    FlutterNativeSplash.remove();
  }

  static void preserverSplash(WidgetsBinding widgetsBinding) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
}
