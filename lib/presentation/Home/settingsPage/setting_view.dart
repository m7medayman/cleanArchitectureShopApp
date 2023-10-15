import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mvvm_shop/app/app_prefs.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/presentation/Home/base.dart';
import 'package:mvvm_shop/presentation/common/text_widget.dart';
import 'package:mvvm_shop/presentation/resources/routs_manager.dart';
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
  final AppPreferences _appPreferences = instance<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: myText(AppStrings.changeLanguage),
          trailing: const Icon(Icons.arrow_back_ios),
          onTap: () {
            changeLanguage();
          },
          leading: Icon(Icons.language),
        ),
        ListTile(
          title: myText(AppStrings.logout),
          trailing: const Icon(Icons.arrow_back_ios),
          onTap: () {
            logout();
          },
          leading: const Icon(Icons.logout),
        )
      ],
    );
  }

  changeLanguage() {
    _appPreferences.changeLanguage();
    Phoenix.rebirth(context);
  }

  logout() async {
    await _appPreferences.logout();
    if (!context.mounted) return;
    Navigator.of(context).pushReplacementNamed(Routs.loginRoute);
  }
}
