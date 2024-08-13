import 'package:flutter/material.dart';
import 'package:smart_home/Pages/home_page/components/add_device.dart';
import 'package:smart_home/Pages/home_page/components/dark_container.dart';
import 'package:smart_home/Pages/home_page/components/savings_container.dart';
import 'package:smart_home/Pages/home_page/components/weather_container.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/model_view_controller/home_view_model.dart';

class Body extends StatelessWidget {
  final HomeScreenViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

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
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: WeatherContainer(model: model),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: SavingsContainer(model: model),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: model.lisLightOn1,
                      switchButton: model.lightSwitch1,
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
                      itsOn: model.lisLightOn2,
                      switchButton: model.lightSwitch2,
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
                      itsOn: model.lisLightOn3,
                      switchButton: model.lightSwitch3,
                      onTap: () {
                        // Navigator.of(context).pushNamed(SmartLight.routeName);
                      },
                      iconAsset: 'assets/icons/svg/light.svg',
                      device: 'Lightening',
                      deviceCount: 'Device 3',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: model.lisFanON,
                      switchButton: model.fanSwitch,
                      onTap: () {
                        // Navigator.of(context).pushNamed(SmartFan.routeName);
                      },
                      iconAsset: 'assets/icons/svg/fan.svg',
                      device: 'Fan',
                      deviceCount: 'Device 4',
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
                      itsOn: model.lisLightOn3,
                      switchButton: model.lightSwitch3,
                      onTap: () {
                        // Navigator.of(context).pushNamed(SmartLight.routeName);
                      },
                      iconAsset: 'assets/icons/svg/light.svg',
                      device: 'Lightening',
                      deviceCount: 'Device 5',
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
