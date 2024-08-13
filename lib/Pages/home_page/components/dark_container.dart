import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/config/size_config.dart';

class DarkContainer extends StatelessWidget {
  final String iconAsset;
  final VoidCallback onTap;
  final String device;
  final String deviceCount;
  final bool itsOn;
  final VoidCallback switchButton;
  const DarkContainer({
    Key? key,
    required this.iconAsset,
    required this.onTap,
    required this.device,
    required this.deviceCount,
    required this.itsOn,
    required this.switchButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getProportionateScreenWidth(140),
        height: getProportionateScreenHeight(140),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: itsOn ? Colors.blue : Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(45, 45)),
                    ),
                    child: SvgPicture.asset(
                      iconAsset,
                      color: itsOn ? Colors.white : Colors.blue,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: itsOn ? Colors.white : Colors.black,
                        ),
                  ),
                  Text(
                    deviceCount,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: itsOn
                            ? Colors.white
                            : const Color.fromRGBO(166, 166, 166, 1),
                        fontSize: 13,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1.6),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itsOn ? 'On' : 'Off',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: itsOn ? Colors.white : Colors.black,
                        ),
                  ),
                  GestureDetector(
                    onTap: switchButton,
                    child: Container(
                      width: 48,
                      height: 25.6,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: itsOn ? Colors.white : Colors.black26,
                        border: Border.all(
                          color: itsOn
                              ? Colors.white
                              : const Color.fromRGBO(166, 166, 166, 1),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          itsOn ? const Spacer() : const SizedBox(),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: itsOn ? Colors.white : Colors.pink,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: itsOn ? Colors.blue : Colors.white,
                                width: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
