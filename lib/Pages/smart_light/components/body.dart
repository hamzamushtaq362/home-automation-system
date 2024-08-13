import 'package:flutter/material.dart';
import 'package:smart_home/Pages/smart_light/components/desktop_body.dart';
import 'package:smart_home/Pages/smart_light/components/mobile_body.dart';
import 'package:smart_home/model_view_controller/smart_light_view_model.dart';
import 'package:smart_home/services/responsive.dart';

class Body extends StatelessWidget {
  final SmartLightViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileBody(
            model: model,
          ),
          desktopBody: DesktopBody(
            model: model,
          )),
    );
  }
}
