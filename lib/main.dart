import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_home/Pages/login_page/login_page.dart';
import 'package:smart_home/Pages/start/start_up_page.dart';
import 'package:smart_home/provider/getit.dart';
import 'package:smart_home/routes/routes.dart';
import 'package:smart_home/services/navigation_service.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = const FlutterSecureStorage();

  Future<bool> checkloginstatus() async {
    String? value = await storage.read(key: "uid");
    if (value == null) {
      return false;
    } else {
      return true;
    }
  }

  final ThemeMode themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SmartHome',
        navigatorKey: getIt<NavigationService>().navigatorKey,
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: ThemeData(
          fontFamily: 'Nato Sans',
          colorScheme: const ColorScheme.light(
            primary: Colors.grey,
            //secondary: Color(0xFFF4AE47),
            surface: Color(0xFFC4C4C4),
            background: Color(0xFFFFFFFF),
            error: Color(0xFFB00020),
            onPrimary: Colors.black,
            onSecondary: Colors.white,
            onSurface: Colors.blue,
            onBackground: Colors.blue,
            onError: Colors.white,
            brightness: Brightness.light,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Color(0xFF464646),
            ),
            headline2: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color.fromARGB(255, 56, 55, 55),
            ),
            headline3: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color(0xFF464646),
            ),
            headline4: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color(0xFFBDBDBD),
            ),
            headline5: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xFFBDBDBD),
            ),
            headline6: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF464646),
            ),
          ),
        ),
        routes: routes,
        home: FutureBuilder(
            future: checkloginstatus(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data == false) {
                return const LoginPage();
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    color: Colors.blue,
                    child: const Center(child: CircularProgressIndicator()));
              }
              return const StartUpPage();
            }));
  }
}
