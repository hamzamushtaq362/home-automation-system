import 'package:flutter/material.dart';
import 'package:smart_home/Pages/edit_profile/components/profile_desktop.dart';
import 'package:smart_home/Pages/edit_profile/components/profile_mobile.dart';
import 'package:smart_home/services/responsive.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String routeName = '/home-page';
  @override
  Widget build(BuildContext context) {
    //final CurrentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: const ProfileMobile(
            email: '',
            name: '',
            urlImage: '',
          ),
          desktopBody: const ProfileDesktop(
            email: '',
            name: '',
            urlImage: '',
          )),
    );
  }
}
