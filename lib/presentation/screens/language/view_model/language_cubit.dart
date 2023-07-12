import 'package:ecommerce_app/data/localization/app_lang_cach.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  static LanguageCubit get(context) => BlocProvider.of(context);

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage() async {
    final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
    Locale newLocale;
    if (cachedLanguageCode == 'ar') {
      newLocale = const Locale('en', '');
    } else {
      newLocale = const Locale('ar', '');
    }
    await LanguageCacheHelper().cacheLanguageCode(newLocale.languageCode);
    emit(ChangeLocaleState(newLocale));
  }
}
