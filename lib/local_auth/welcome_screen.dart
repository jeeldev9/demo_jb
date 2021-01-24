import 'package:flutter/material.dart';

class welcomeScreen extends StatefulWidget {
  welcomeScreen({Key key}) : super(key: key);

  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(centerTitle: true,title: Text("Welcome"),),
    );
  }
}