import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mvvm_shop/app/app_prefs.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/presentation/Home/base.dart';
import 'package:mvvm_shop/presentation/resources/strings_manager.dart';

class SettingsPageView extends StatefulWidget with BaseViewNavigationBarItem {
  static String name = 'settings';
  static Icon icon = const Icon(Icons.settings);
  const SettingsPageView({super.key});

  @override
  State<SettingsPageView> createState() => _SettingsPageViewState();

  @override
  Icon getIcon() {
    // TODO: implement getIcon
    return icon;
  }

  @override
  String getName() {
    // TODO: implement getName
    return name;
  }
}

class _SettingsPageViewState extends State<SettingsPageView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(AppStrings.changeLanguage.tr()),
          trailing: Icon(Icons.arrow_back_ios),
          onTap: () {
            changeLanguage();
          },
          leading: Icon(Icons.language),
        )
      ],
    );
  }

  changeLanguage() {
    instance<AppPreferences>().changeLanguage();
    Phoenix.rebirth(context);
  }
}
