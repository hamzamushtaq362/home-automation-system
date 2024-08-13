import 'package:flutter/material.dart';
import 'package:smart_home/Pages/login_page/login_desktop.dart';
import 'package:smart_home/Pages/login_page/login_mobile.dart';
import 'package:smart_home/services/responsive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: const LoginPageMobile(), desktopBody: const LoginPageDesktop()),
    );
  }
}
