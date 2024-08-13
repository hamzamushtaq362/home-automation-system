import 'package:flutter/material.dart';
import 'package:smart_home/services/dimesions.dart';

class ResponsiveLayout extends StatelessWidget {
  // const ResponsiveLayout({Key? key}) : super(key: key);
  final Widget mobileBody;
  final Widget desktopBody;

  // ignore: prefer_const_constructors_in_immutables
  ResponsiveLayout(
      {Key? key, required this.mobileBody, required this.desktopBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobilewidth) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
