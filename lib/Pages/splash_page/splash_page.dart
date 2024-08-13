// ignore_for_file: use_key_in_widget_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_home/Pages/login_page/login_page.dart';

class SplahPage extends StatefulWidget {
  static String routeName = '/splash-page';
  @override
  _SplahPageState createState() => _SplahPageState();
}

class _SplahPageState extends State<SplahPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SizedBox(
        child: Image.asset(
          "assets/images/splash_img.png",
          color: Colors.white,
          
        ),
      ),
      // child: FlutterLogo(size: MediaQuery.of(context).size.height)
    );
  }
}
