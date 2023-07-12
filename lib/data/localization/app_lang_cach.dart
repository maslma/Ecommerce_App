import 'package:ecommerce_app/data/local/chach_helper.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    ChachHelper.saveData(key: "LOCALE", value: languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final cachedLanguageCode = ChachHelper.getData(key: "LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }

  static bool isAr = ChachHelper.getData(key: "LOCALE") == 'ar';
}
