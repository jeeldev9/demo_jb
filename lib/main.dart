import 'package:flutter/material.dart';
import 'package:demo_jb/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      home: HomeScreen(),
    );
  }
}
