import 'package:flutter/material.dart';
import 'package:smart_home/Pages/edit_profile/components/edit_profile_desktop.dart';
import 'package:smart_home/Pages/edit_profile/components/edit_profile_mobile.dart';
import 'package:smart_home/services/responsive.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  static String routeName = '/home-page';
  @override
  Widget build(BuildContext context) {
    //final CurrentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: const EditProfileMobile(),
          desktopBody: const EditProfileDesktop()),
    );
  }
}
