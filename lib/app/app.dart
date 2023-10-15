import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_shop/app/app_prefs.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/presentation/resources/routs_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppPreferences _appPrefrences = instance<AppPreferences>();
  @override
  void didChangeDependencies() {
    _appPrefrences.getLocal().then((local) => context.setLocale(local));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutGenerator.getRoute,
      initialRoute: Routs.splashRoute,
      theme: getAppTheme(),
    );
  }
}
