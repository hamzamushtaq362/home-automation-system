import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home/Pages/temperature_pages/components/body.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/model_view_controller/home_view_model.dart';
import 'package:smart_home/provider/base_view.dart';
import 'package:smart_home/widgets/drawer_dashboard.dart';

class MyMobileBody extends StatelessWidget {
  static String routeName = '/home-page';
  const MyMobileBody({Key? key}) : super(key: key);

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
                        'Temperature',
                        style: Theme.of(context).textTheme.headline2,
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
              ),
              body: Body(
                model: model,
              ),
            ),
          );
        });
  }
}




// import 'package:flutter/material.dart';
// import 'package:smart_home/widgets/drawer_dashboard.dart';

// class MyMobileBody extends StatelessWidget {
//   const MyMobileBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const MenuDashboardPage(),
//       backgroundColor: Colors.deepPurple[200],
//       appBar: AppBar(
//         title: const Text('M O B I L E'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // youtube video
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Container(
//                   color: Colors.deepPurple[400],
//                 ),
//               ),
//             ),

//             // comment section & recommended videos
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 8,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       color: Colors.deepPurple[300],
//                       height: 120,
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


