import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_start_up_project/presentation/splash/splash_view.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgetPassword = "/forgetPassword";
  static const String main = "/main";
  static const String home = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashView());

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
                child: Text("No Route Defined"),
              ),
            ));
  }
}
