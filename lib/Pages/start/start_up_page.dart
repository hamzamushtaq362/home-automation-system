import 'package:flutter/material.dart';
import 'package:smart_home/Pages/start/body/start_up_desktop.dart';
import 'package:smart_home/Pages/start/body/start_up_mobbile.dart';
import 'package:smart_home/services/responsive.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({Key? key}) : super(key: key);
  static String routeName = '/start-page';

  @override
  Widget build(BuildContext context) {
    //final CurrentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: const StartUPMobile(),
          desktopBody: const StartUpDesktop()),
    );
  }
}
