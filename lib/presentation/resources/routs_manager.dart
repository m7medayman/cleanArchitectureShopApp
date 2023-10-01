import 'package:flutter/material.dart';
import 'package:mvvm_shop/presentation/forgetPassword/emaiSubmit/view/email_submit_view.dart';
import 'package:mvvm_shop/presentation/login/view/login_view.dart';
import 'package:mvvm_shop/presentation/signUp/view/signUp_view.dart';
import 'package:mvvm_shop/presentation/spalsh/splash_view.dart';

import '../onboarding/view/onboarding_view.dart';

class Routs {
  static const String splashRoute = '/';
  static const String onBoardingRoute = 'onBoarding';
  static const String loginRoute = 'login';
  static const String signUpRoute = 'signUp';
  static const String forgetPasswordEmailSubmit = 'emailSubmit';
  static const String forgetPasswordCodeSubmit = 'codeSubmit';
}

class RoutGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routs.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routs.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routs.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routs.forgetPasswordEmailSubmit:
        return MaterialPageRoute(builder: (_) => const EmailSubmitView());
      case Routs.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpView());
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
