import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class QYLocalizations {
  QYLocalizations(this.locale);

  final Locale locale;

  static QYLocalizations of(BuildContext context) {
    return Localizations.of(context, QYLocalizations);
  }

  static Map<String, Map<String, String>> _value = {
    // "zh": {"xuanzeriqi": "选择日期"},
    // "en": {"xuanzeriqi": "Select Date"}
  };

  Future loadJson() async {
    final jsonStr = await rootBundle.loadString('assets/json/i18n.json');
    Map<String, dynamic> map = json.decode(jsonStr);
    _value =
        map.map((key, value) => MapEntry(key, value.cast<String, String>()));
  }

  String? get xuanzeriqi {
    return _value[locale.languageCode]?["xuanzeriqi"];
  }
}
