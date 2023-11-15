import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/screens/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MatDongSan',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: LoginSignSceen(),
      home: MyWidget(),
    );
  }
}
