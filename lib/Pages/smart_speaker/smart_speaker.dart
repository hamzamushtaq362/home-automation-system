import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/model_view_controller/smart_speaker_view_model.dart';
import 'package:smart_home/provider/base_view.dart';
import 'components/body.dart';
import 'components/expandable_bottom_sheet.dart';

class SmartSpeaker extends StatelessWidget {
  static String routeName = 'smart-speaker';
  const SmartSpeaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SmartSpeakerViewModel>(
        onModelReady: (model) => {},
        builder: (context, model, child) {
          return Material(
            child: SlidingUpPanel(
              minHeight: getProportionateScreenHeight(70),
              controller: model.pc,
              backdropEnabled: true,
              boxShadow: const [],
              body: Scaffold(
                backgroundColor: const Color(0xFFF2F2F2),
                body: Body(
                  model: model,
                ),
              ),
              panel: ExpandableBottomSheet(model: model),
            ),
          );
        });
  }
}
