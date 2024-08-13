import 'package:flutter/material.dart';
import 'package:smart_home/Pages/smart_fan/components/desktop_bottom_up.dart';
import 'package:smart_home/Pages/smart_fan/components/mobile_bottom_up.dart';
import 'package:smart_home/model_view_controller/smart_fan_view_model.dart';
import 'package:smart_home/services/responsive.dart';

class ExpandableBottomSheet extends StatelessWidget {
  const ExpandableBottomSheet({Key? key, required this.model})
      : super(key: key);

  final SmartFanViewModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileExpandableBottomSheet(
            model: model,
          ),
          desktopBody: DesktopExpandableBottomSheet(
            model: model,
          )),
    );
  }
}
