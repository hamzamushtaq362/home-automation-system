import 'package:flutter/material.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/database/gateway.dart';
import 'package:smart_home/model_view_controller/home_view_model.dart';

class WeatherContainer extends StatefulWidget {
  const WeatherContainer({Key? key, required this.model}) : super(key: key);

  final HomeScreenViewModel model;

  @override
  State<WeatherContainer> createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  String temp = '0.0';
  String hum = '0.0';
  @override
  void initState() {
    super.initState();
    _activelisner();
  }

  _activelisner() {
    routOftemp.onValue.listen((event) {
      final Object? temperatureOf = event.snapshot.value;
      setState(() {
        temp = temperatureOf.toString();
      });
    });
    routOfhum.onValue.listen((event) {
      final Object? humOf = event.snapshot.value;
      setState(() {
        hum = humOf.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: getProportionateScreenHeight(310),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFFFFFF),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenHeight(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(250),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Temperature $temp',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        'Humidity $hum',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Text(
                        '04 Jul 2022',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        'Lahore,Pakistan',
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
          child: Image.asset(
            'assets/images/weather/8.png',
            height: getProportionateScreenHeight(110),
            width: getProportionateScreenWidth(140),
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
