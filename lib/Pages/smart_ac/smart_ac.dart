import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smart_home/Pages/smart_ac/components/expandable_bottom_sheet.dart';
import 'package:smart_home/model_view_controller/smart_ac_view_model.dart';
import 'package:smart_home/provider/base_view.dart';

import 'components/body.dart';

class SmartAC extends StatelessWidget {
  static String routeName = '/smart-ac';
  const SmartAC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SmartACViewModel>(
        onModelReady: (model) => {},
        builder: (context, model, child) {
          return Material(
            child: SlidingUpPanel(
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
