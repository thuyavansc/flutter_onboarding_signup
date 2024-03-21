import 'package:flutter/material.dart';
import 'package:flutter_onboarding_signup/routes.dart';
import 'package:flutter_onboarding_signup/theme.dart';

import 'screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      // ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // )
      home: const OnBardingScreen(),
      routes: routes,
    );
  }
}
