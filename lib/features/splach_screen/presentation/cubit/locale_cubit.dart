import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_train/core/usecases/usecase.dart';
import 'package:qoute_train/core/utils/app_strings.dart';
import 'package:qoute_train/features/splach_screen/domain/usecases/change_lang.dart';
import 'package:qoute_train/features/splach_screen/domain/usecases/get_saved_lang.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCases getSavedLangUseCases;
  final ChangeLangUseCases changeLangUseCases;
  LocaleCubit({
    required this.getSavedLangUseCases,
    required this.changeLangUseCases,
  }) : super(
          const ChangeLocaleState(
            selectLocale: Locale(
              AppStrings.englishCode,
            ),
          ),
        );

  String currentLangCode = AppStrings.englishCode;
  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCases.call(NoParams());
    response.fold(
      (failure) => log(AppStrings.cacheFailure),
      (value) {
        currentLangCode = value!;
        emit(ChangeLocaleState(selectLocale: Locale(currentLangCode)));
      },
    );
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUseCases.call(langCode);
    response.fold(
      (failure) => log(AppStrings.cacheFailure),
      (value) {
        currentLangCode = langCode;
        emit(ChangeLocaleState(selectLocale: Locale(currentLangCode)));
      },
    );
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);
  void toArabic() => _changeLang(AppStrings.arabicCode);
}
