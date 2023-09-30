import 'package:flutter/material.dart';
import 'package:mvvm_shop/presentation/resources/routs_manager.dart';

import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutGenerator.getRoute,
      initialRoute: Routs.home,
      theme: getAppTheme(),
    );
  }
}
