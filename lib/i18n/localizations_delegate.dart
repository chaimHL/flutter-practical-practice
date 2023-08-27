import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:food_galaxy/i18n/localizations.dart';

class QYlocalizationsDelegate extends LocalizationsDelegate<QYLocalizations> {
  static QYlocalizationsDelegate delegate = QYlocalizationsDelegate();

  // 判断语言是否支持
  @override
  bool isSupported(Locale locale) {
    return ["zh", "en"].contains(locale.languageCode);
  }

  @override
  Future<QYLocalizations> load(Locale locale) async {
    // return SynchronousFuture(QYLocalizations(locale));

    final lo = QYLocalizations(locale);
    await lo.loadJson();
    return lo;
  }

  // 当需要国际化的 widget 重新 build 时，是否调用 load 重新加载 QYLocalizations 资源
  @override
  bool shouldReload(covariant LocalizationsDelegate<QYLocalizations> old) {
    return false;
  }
}
