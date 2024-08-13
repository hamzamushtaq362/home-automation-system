import 'package:flutter/material.dart';
import 'package:smart_home/Pages/home_page/components/add_device.dart';
import 'package:smart_home/Pages/home_page/components/dark_container.dart';
import 'package:smart_home/Pages/home_page/components/music_layout.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/model_view_controller/home_view_model.dart';

class DrawingRoom extends StatelessWidget {
  final HomeScreenViewModel model;
  const DrawingRoom({Key? key, required this.model}) : super(key: key);

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
                      itsOn: model.disLightOn1,
                      switchButton: model.dlightSwitch1,
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
                      itsOn: model.disLightOn2,
                      switchButton: model.dlightSwitch2,
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
                      itsOn: model.disLightOn3,
                      switchButton: model.dlightSwitch3,
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
                      itsOn: model.disAcON,
                      switchButton: model.dacSwitch,
                      onTap: () {
                        // Navigator.of(context).pushNamed(SmartFan.routeName);
                      },
                      iconAsset: 'assets/icons/svg/ac.svg',
                      device: 'Air Conditioner',
                      deviceCount: 'Device 4',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: const MusicLayout(),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: model.disSpeaker,
                      switchButton: model.dSpeakerSwitch,
                      onTap: () {
                        // Navigator.of(context).pushNamed(SmartLight.routeName);
                      },
                      iconAsset: 'assets/icons/svg/speaker.svg',
                      device: 'Speaker',
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
