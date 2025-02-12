part of 'locale_cubit.dart';

sealed class LocaleState extends Equatable {
  final Locale locale;
  const LocaleState(this.locale);

  @override
  List<Object> get props => [];
}

class ChangeLocaleState extends LocaleState {
  const ChangeLocaleState({required Locale selectLocale}) : super(selectLocale);
}
