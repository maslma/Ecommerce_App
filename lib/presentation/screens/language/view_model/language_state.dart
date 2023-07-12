part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class ChangeLocaleState extends LanguageState {
  final Locale locale;
  ChangeLocaleState(this.locale);
}

