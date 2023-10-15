import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mvvm_shop/presentation/resources/language_maneger.dart';
import 'firebase_options.dart';
import 'app/app.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await initGet();
  runApp(
    EasyLocalization(
        supportedLocales: [ENGLISH_LOCAL, ARABIC_LOCAL],
        path:
            "assets/translations", // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: Phoenix(child: MyApp())),
  );
}
