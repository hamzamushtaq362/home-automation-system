import 'package:flutter/cupertino.dart';
import 'package:smart_home/Pages/edit_profile/edit_profile.dart';
import 'package:smart_home/Pages/home_page/home_page.dart';
import 'package:smart_home/Pages/smart_ac/smart_ac.dart';
import 'package:smart_home/Pages/smart_fan/smart_fan.dart';
import 'package:smart_home/Pages/smart_light/smart_light.dart';
import 'package:smart_home/Pages/smart_speaker/smart_speaker.dart';
import 'package:smart_home/Pages/splash_page/splash_page.dart';
import 'package:smart_home/Pages/start/start_up_page.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => const HomePage(),
  SplahPage.routeName: (context) => SplahPage(),
  SmartLight.routeName: (context) => const SmartLight(),
  SmartFan.routeName: (context) => const SmartFan(),
  SmartAC.routeName: (context) => const SmartAC(),
  SmartSpeaker.routeName: (context) => const SmartSpeaker(),
  EditProfile.routeName: (context) => const EditProfile(),
  StartUpPage.routeName: (context) => const StartUpPage(),
};
