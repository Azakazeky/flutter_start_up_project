import 'package:flutter/material.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal(); // singlton instance

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      home: const Scaffold(
        body: Center(
          child: Text("Welcome To Flutter Project"),
        ),
      ),
    );
  }
}
