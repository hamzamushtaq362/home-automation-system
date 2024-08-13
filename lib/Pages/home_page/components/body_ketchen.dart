import 'package:flutter/material.dart';
import 'package:smart_home/Pages/home_page/components/add_device.dart';
import 'package:smart_home/Pages/home_page/components/dark_container.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/model_view_controller/home_view_model.dart';

class KetchenRoom extends StatelessWidget {
  final HomeScreenViewModel model;
  const KetchenRoom({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(7),
          vertical: getProportionateScreenHeight(7),
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: model.kisLightOn1,
                      switchButton: model.klightSwitch1,
                      onTap: () {
                        // Navigator.of(context).pushNamed(SmartLight.routeName);
                      },
                      iconAsset: 'assets/icons/svg/light.svg',
                      device: 'Lightening',
                      deviceCount: 'Device 1',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: model.kisLightOn2,
                      switchButton: model.klightSwitch2,
                      onTap: () {
                        // Navigator.of(context).pushNamed(SmartLight.routeName);
                      },
                      iconAsset: 'assets/icons/svg/light.svg',
                      device: 'Lightening',
                      deviceCount: 'Device 2',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: model.kisFanON,
                      switchButton: model.kfanSwitch,
                      onTap: () {
                        // Navigator.of(context).pushNamed(SmartFan.routeName);
                      },
                      iconAsset: 'assets/icons/svg/fan.svg',
                      device: 'Fan',
                      deviceCount: 'Device 3',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
              child: const AddNewDevice(),
            ),
          ],
        ),
      ),
    );
  }
}
