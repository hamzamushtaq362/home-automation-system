import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home/Pages/edit_profile/components/profile_page.dart';
import 'package:smart_home/Pages/edit_profile/edit_profile.dart';
import 'package:smart_home/Pages/info_pages/join.dart';
import 'package:smart_home/Pages/login_page/login_page.dart';
import 'package:smart_home/Pages/start/start_up_page.dart';
import 'package:smart_home/Pages/temperature_pages/temperatue.dart';
import 'package:smart_home/models/user_model.dart';

class DrawerDashboard extends StatefulWidget {
  const DrawerDashboard({Key? key}) : super(key: key);

  @override
  State<DrawerDashboard> createState() => _DrawerDashboardState();
}

class _DrawerDashboardState extends State<DrawerDashboard> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final storage = const FlutterSecureStorage();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  DatabaseReference? userRef;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userRef = FirebaseDatabase.instance.ref().child('users').child(user!.uid);
    }
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[400],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildHeader(
            urlImage: loggedInUser.profileImage.toString(),
            name: loggedInUser.firstName.toString(),
            email: loggedInUser.email.toString(),
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProfilePage(),
            )),
          ),
          const Divider(
            thickness: 0.5,
            height: 10,
          ),
          // const DrawerHeader(
          //   // child: Text(
          //   //   'Side menu',
          //   //   style: TextStyle(color: Colors.white, fontSize: 25),
          //   // ),

          //   decoration: BoxDecoration(
          //       // color: Colors.deepPurple,
          //       // image: DecorationImage(
          //       //     fit: BoxFit.fill,
          //       //     image: AssetImage(''))
          //       ),
          // ),
          ListTile(
            leading: const Icon(
              Icons.input,
              color: Colors.white,
            ),
            title: const Text('Home',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StartUpPage()));
            },
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.solidUser,
            ),
            title: const Text('Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EditProfile()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.device_thermostat_outlined),
            title: const Text('Temperature',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TemperaturePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text('Join us',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const JoinPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('closed',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 40, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await storage.delete(key: "uid");
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
