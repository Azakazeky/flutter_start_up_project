import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/assets_manager.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/color_manager.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/constant_manager.dart';
import 'package:flutter_start_up_project/presentation/routes_manager/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  Duration delay = const Duration(seconds: AppConstant.splashDuration);
  _startDelay() {
    _timer = Timer(delay, _gonext);
  }

  _gonext() {
    Navigator.pushReplacementNamed(context, Routes.onboarding);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: const Center(
            child: Image(image: AssetImage(ImageAssets.splashLogo))));
  }
}
