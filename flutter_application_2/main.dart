import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/HomePage.dart';

void main(List<String> args) {
  runApp(storeApp());
}

class storeApp extends StatefulWidget {
  const storeApp({super.key});

  @override
  State<storeApp> createState() => _storeAppState();
}

class _storeAppState extends State<storeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store on line',
      home: Homepage(),
    );
  }
}
