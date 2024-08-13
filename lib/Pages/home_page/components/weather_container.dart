import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/database/appliencs_address.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(110),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(70),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      temp,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'Temperature',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text(
                      '27 Mar 2022',
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Image.asset(
            'assets/images/weather/8.png',
            height: getProportionateScreenHeight(80),
            width: getProportionateScreenWidth(70),
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
