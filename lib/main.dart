import 'package:flutter/material.dart';
import 'package:portfolio/desktopHome.dart';
import 'package:portfolio/mobHome.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        fontFamily: "GoogleSansRegular"),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:(MediaQuery.of(context).size.width < 700 ? MobHome() : DesktopHome())
    );
  }
}
