import 'package:flutter/material.dart';
import 'package:smart_home/Pages/home_page/components/desktop_layout.dart';
import 'package:smart_home/Pages/home_page/components/mobile_layout.dart';
import 'package:smart_home/services/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
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
