import 'package:flutter/material.dart';
import 'package:smart_home/Pages/smart_light/components/desktop_extand_able_bottom.dart';
import 'package:smart_home/Pages/smart_light/components/mobile_extand_able_bottom.dart';
import 'package:smart_home/model_view_controller/smart_light_view_model.dart';
import 'package:smart_home/services/responsive.dart';

class ExpandableBottomSheet extends StatelessWidget {
  const ExpandableBottomSheet({Key? key, required this.model})
      : super(key: key);
  final SmartLightViewModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileExpandableBottomSheet(
            model: model,
          ),
          desktopBody: DeesktopExpandableBottomSheet(
            model: model,
          )),
    );
  }
}
