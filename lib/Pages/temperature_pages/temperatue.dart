import 'package:flutter/material.dart';
import 'package:smart_home/Pages/temperature_pages/components/desktop_layout.dart';
import 'package:smart_home/Pages/temperature_pages/components/mobile_layout.dart';

import 'package:smart_home/services/responsive.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({Key? key}) : super(key: key);
  static String routeName = '/home-page';
  @override
  Widget build(BuildContext context) {
    //final CurrentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: const MyMobileBody(), desktopBody: const MyDesktopBody()),
    );
  }
}
