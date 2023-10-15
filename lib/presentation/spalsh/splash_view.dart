import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_shop/app/app_prefs.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/presentation/resources/assets_manager.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/constant_manager.dart';
import 'package:mvvm_shop/presentation/resources/routs_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreferences _appPref = instance<AppPreferences>();
  Timer? _timer;
  _goNext() async {
    bool firstTime = await _appPref.getFirstTimeUseApp();

    if (firstTime) {
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, Routs.onBoardingRoute);
    } else {
      loginCheck();
    }
  }

  void loginCheck() async {
    bool isLogin = await _appPref.getLoginChecker();
    if (isLogin) {
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, Routs.home);
    } else {
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, Routs.loginRoute);
    }
  }

  void _startDelay() {
    _timer = Timer(Duration(seconds: AppConstant.splashDelay), _goNext);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(ImageAssets.splashLogo),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }
}
