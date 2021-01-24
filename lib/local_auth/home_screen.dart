import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'dart:async';
import 'package:local_auth/local_auth.dart';

class HomeScreenLocalAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(child: RaisedButton(onPressed:(){},child:Text("Finger-print",style: TextStyle(color: Colors.black87),),),),
      ),
    );
  }
}