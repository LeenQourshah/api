// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "Notification1": "لين قورشة أعجبت بتعليقك.",
    "Notification2": "قامت لين قورشه بالتعليق على منشورك.",
    "Notification3": "قامت بيان أمجد بالتعليق على منشورك.",
    "theme": "قم بتغيير اللون."
  };
  static const Map<String, dynamic> en = {
    "Notification1": "Leen Qourshah liked your comment.",
    "Notification2": "Leen Qourshah commented on your post.",
    "Notification3": " Bayan Amjad commented on your post.",
    "theme": "Change Theme."
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}
