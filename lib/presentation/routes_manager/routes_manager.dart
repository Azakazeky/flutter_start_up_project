import 'package:flutter/material.dart';
import 'package:flutter_start_up_project/presentation/onboarding/view/onboarding_view.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/string_manager.dart';
import 'package:flutter_start_up_project/presentation/splash/splash_view.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgetPassword = "/forgetPassword";
  static const String main = "/main";
  static const String home = "/home";
  static const String onboarding = "/onboarding";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      // case Routes.splash:
      //   return MaterialPageRoute(builder: (_) => );

      // case Routes.splash:
      //   return MaterialPageRoute(builder: (_) => );

      // case Routes.splash:
      //   return MaterialPageRoute(builder: (_) => );

      // case Routes.splash:
      //   return MaterialPageRoute(builder: (_) => );

      // case Routes.splash:
      //   return MaterialPageRoute(builder: (_) => );

      // case Routes.splash:
      //   return MaterialPageRoute(builder: (_) => );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text(AppString.noRouteFound),
              ),
            ));
  }
}
