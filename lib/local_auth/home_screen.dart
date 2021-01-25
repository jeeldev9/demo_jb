import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'welcome_screen.dart';
import 'dart:async';
import 'package:local_auth/local_auth.dart';

import 'welcome_screen.dart';

class HomeScreenLocalAuth extends StatefulWidget {
  @override
  _HomeScreenLocalAuthState createState() => _HomeScreenLocalAuthState();
}

class _HomeScreenLocalAuthState extends State<HomeScreenLocalAuth> {
  //Local authentication using fingerprint

  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: false,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
      if (authenticated) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => welcomeScreen()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkBiometrics();
    _getAvailableBiometrics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: _authenticate,
            child: Text(
              "$_authorized",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
