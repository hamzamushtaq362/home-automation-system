import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home/Pages/home_page/components/body.dart';
import 'package:smart_home/Pages/home_page/components/body_drawing.dart';
import 'package:smart_home/Pages/home_page/components/body_ketchen.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/model_view_controller/home_view_model.dart';
import 'package:smart_home/provider/base_view.dart';
import 'package:smart_home/widgets/drawer_dashboard.dart';

class MyDesktopBody extends StatelessWidget {
  static String routeName = '/home-page';
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
        onModelReady: (model) => {
              model.generateRandomNumber(),
            },
        builder: (context, model, child) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              drawer: const DrawerDashboard(),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                title: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(
                      4,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Home',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xffdadada),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(45, 45)),
                        ),
                        child: IconButton(
                          splashRadius: 25,
                          icon: const Icon(
                            FontAwesomeIcons.solidUser,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            // Navigator.of(context).pushNamed(EditProfile.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                leadingWidth: getProportionateScreenWidth(170),
                bottom: PreferredSize(
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.white.withOpacity(0.3),
                      indicatorColor: Colors.blue,
                      indicatorWeight: 5,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(
                          child: Text(
                            'Living Room',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Drawing',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Kitchen',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ]),
                  preferredSize: Size.fromHeight(
                    getProportionateScreenHeight(
                      35,
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: 800,
                      child: Body(
                        model: model,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 800,
                      child: DrawingRoom(
                        model: model,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 800,
                      child: KetchenRoom(
                        model: model,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
