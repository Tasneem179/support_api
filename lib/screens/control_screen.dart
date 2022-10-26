import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:support/screens/Login.dart';
import 'package:support/screens/home_screen.dart';


import '../provider/control_provider.dart';

class ControlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ControlProvider>(builder: (context,provider,child){
      return provider.token==null? LoginScreen():HomeScreen();
    });
  }
}
