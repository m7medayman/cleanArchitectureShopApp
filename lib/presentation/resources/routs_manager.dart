import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_shop/presentation/spalsh/splash_view.dart';

import '../onboarding/view/onboarding_view.dart';

class Routs {
  static const String splashRoute = '/';
  static const String onBoardingRoute = 'onBoarding';
}

class RoutGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routs.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routs.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      default:
        return unDefinedRoute();
    }
  }

  static unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Undefined route'),
              ),
              body: Container(),
            ));
  }
}
