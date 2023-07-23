import 'package:connect_now/screens/login_screen.dart';
import 'package:connect_now/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor,),
      routes: {'/login': (context) => const LoginScreen()},
      home: const LoginScreen(),
    );
  }
}

