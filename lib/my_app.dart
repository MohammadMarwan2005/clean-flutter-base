import 'package:clean_flutter_base/presentation/lang/app_localization.dart';
import 'package:clean_flutter_base/presentation/lang/lang_cubit.dart';
import 'package:clean_flutter_base/presentation/lang/lang_state.dart';
import 'package:clean_flutter_base/presentation/main/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'common/di/get_it.dart';

class MyApp extends StatelessWidget {
  final GoRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider<LangCubit>(create: (context) => getIt()),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, langState) {
          return BlocBuilder<MainCubit, MainState>(
            builder: (context, mainState) {
              if (mainState is MainStateDone && langState is LangLoaded) {
                return MaterialApp.router(
                  locale: Locale(langState.lang),
                  supportedLocales: const [Locale('en'), Locale('ar')],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                  ],
                  title: 'Core App',
                  theme: ThemeData(
                    primaryColor: Colors.teal,
                    scaffoldBackgroundColor: Colors.white,
                  ),
                  debugShowCheckedModeBanner: false,
                  routerConfig: appRouter,
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (deviceLocale != null &&
                            deviceLocale.languageCode == locale.languageCode) {
                          return deviceLocale;
                        }
                      }
                      return supportedLocales.first;
                    }
                );
              } else {
                return MaterialApp(
                  home: Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
