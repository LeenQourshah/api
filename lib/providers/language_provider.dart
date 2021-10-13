import 'package:api_app/models/locales.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!LocalesLanguages.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
