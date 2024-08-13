import 'package:flutter/material.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/model_view_controller/home_view_model.dart';

class SavingsContainer extends StatelessWidget {
  const SavingsContainer({Key? key, required this.model}) : super(key: key);

  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(100),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Energy Saving',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '+35%',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.green,
                          ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text(
                      '23.5 kWh',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                SizedBox(
                  width: getProportionateScreenWidth(90),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Image.asset(
            'assets/images/thunder.png',
            height: getProportionateScreenHeight(100),
            width: getProportionateScreenWidth(140),
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
