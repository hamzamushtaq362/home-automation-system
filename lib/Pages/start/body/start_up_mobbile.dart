import 'package:flutter/material.dart';
import 'package:smart_home/Pages/edit_profile/edit_profile.dart';
import 'package:smart_home/Pages/home_page/home_page.dart';
import 'package:smart_home/Pages/temperature_pages/temperatue.dart';

class StartUPMobile extends StatefulWidget {
  const StartUPMobile({Key? key}) : super(key: key);
  static String routeName = '/start-up';
  @override
  State<StartUPMobile> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<StartUPMobile> {
  int currentTab = 0;
  final List<Widget> pages = [
    const HomePage(),
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
            currentTab = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const TemperaturePage();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.device_thermostat,
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            "Temperature",
                            style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const EditProfile();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
