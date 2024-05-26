import 'package:flutter/material.dart';
import 'package:flutter_testing/view/home.dart';
import 'package:flutter_testing/view/login.dart';
// import 'view/post_view.dart';

void main(List<String> args) {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}