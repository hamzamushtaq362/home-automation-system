import 'package:flutter/material.dart';
import 'package:smart_home/Pages/registration_page/components/registration.desktop.dart';
import 'package:smart_home/Pages/registration_page/components/registration_mobile.dart';
import 'package:smart_home/services/responsive.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: const RegistrationMobile(), desktopBody: const RegistrationDesktop()),
    );
  }
}
