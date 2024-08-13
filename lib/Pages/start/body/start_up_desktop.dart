import 'package:flutter/material.dart';
import 'package:smart_home/Pages/home_page/home_page.dart';
import 'package:smart_home/Pages/room_page/room_page.dart';

class StartUpDesktop extends StatefulWidget {
  const StartUpDesktop({Key? key}) : super(key: key);
  static String routeName = '/start-up';
  @override
  State<StartUpDesktop> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<StartUpDesktop> {
  int currentTab = 0;
  final List<Widget> pages = [
    const HomePage(),
    const RoomPage(),
    const HomePage(),
    const RoomPage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.home,
        ),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            currentScreen = const HomePage();
            currentTab = 2;
          });
        },
      ),
    );
  }
}
