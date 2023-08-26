import 'dart:ui';

import 'package:flutter/cupertino.dart';

class QYLocalizations {
  QYLocalizations(this.locale);

  final Locale locale;

  static QYLocalizations of(BuildContext context) {
    return Localizations.of(context, QYLocalizations);
  }

  static Map<String, Map<String, String>> _value = {
    "zh": {"xuanzeriqi": "选择日期"},
    "en": {"xuanzeriqi": "Select Date"}
  };

  String? get xuanzeriqi {
    return _value[locale.languageCode]?["xuanzeriqi"];
  }
}
