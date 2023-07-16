import 'package:ecommerce_app/data/localization/app_lang_cach.dart';
import 'package:ecommerce_app/presentation/presentation_managers/theme_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  static LanguageCubit get(context) => BlocProvider.of(context);

  ThemeData themeData = themeEnglish;

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage() async {
    final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
    Locale newLocale;
    themeData = cachedLanguageCode == "ar" ? themeArabic: themeEnglish;
    if (cachedLanguageCode == 'ar') {
      newLocale = const Locale('en', '');
    } else {
      newLocale = const Locale('ar', '');
    }
    await LanguageCacheHelper().cacheLanguageCode(newLocale.languageCode);
    emit(ChangeLocaleState(newLocale));
  }
}
