import 'package:flutter/material.dart';
import 'package:useradgents_exercise/config/routes.dart';
import 'package:useradgents_exercise/utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      routes: appRoutes,
    );
  }
}
