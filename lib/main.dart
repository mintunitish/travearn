import 'package:flutter/material.dart';
import 'package:travearn/components/app_background.dart';
import 'package:travearn/pages/login_page.dart';

void main() => runApp(Travearn());

class Travearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travearn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        fontFamily: 'Open Sans'
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              AppBackground(),
              LoginPage()
            ],
          ),
          backgroundColor: Colors.white,
        ),
      )
    );
  }
}
