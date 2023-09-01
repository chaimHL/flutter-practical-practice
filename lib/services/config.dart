import 'package:flutter/foundation.dart';

class QYHttpConfig {
  static const String baseUrl = kReleaseMode
      ? 'https://www.fastmock.site/mock/34c961fb7d37955137b2f7e30cabc377/api'
      : 'https://www.fastmock.site/mock/34c961fb7d37955137b2f7e30cabc377/api';

  static const Duration timeout = Duration(seconds: 10);
}
