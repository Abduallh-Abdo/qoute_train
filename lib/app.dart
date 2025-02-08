import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_train/config/locale/app_localizations_setup.dart';
import 'package:qoute_train/config/routes/app_routes.dart';
import 'package:qoute_train/config/themes/app_themes.dart';
import 'package:qoute_train/core/utils/app_strings.dart';
import 'package:qoute_train/features/splach_screen/presentation/cubit/locale_cubit.dart';
import 'package:qoute_train/injection.dart' as di;

class QouteApp extends StatelessWidget {
  const QouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LocaleCubit>()..getSavedLang(),
        )
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appThemes(),
            title: AppStrings.appName,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            locale: state.locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
