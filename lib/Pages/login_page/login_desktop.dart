import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_home/Pages/info_pages/info.dart';
import 'package:smart_home/Pages/info_pages/join.dart';
import 'package:smart_home/Pages/registration_page/registration_page.dart';
import 'package:smart_home/Pages/start/start_up_page.dart';
import 'package:smart_home/widgets/text_widget.dart';
import 'package:smart_home/widgets/wsized.dart';

class LoginPageDesktop extends StatefulWidget {
  // static const String id = "LoginPageDesktop";
  const LoginPageDesktop({Key? key}) : super(key: key);

  @override
  State<LoginPageDesktop> createState() => _LoginPageDesktopState();
}

class _LoginPageDesktopState extends State<LoginPageDesktop> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;
  final storage = const FlutterSecureStorage();

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mail,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ));
    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.vpn_key,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 40, 42, 57),
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          height: 40,
                          width: 40,
                        ),
                        TextWidget(
                          text: '  Smart Home App.',
                          textcolor: Colors.white,
                          textsize: 22,
                          fontWeight: FontWeight.normal,
                        ),
                        WSizedBox(wval: 0.1, hval: 0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const InfoPage()));
                          },
                          child: TextWidget(
                            text: 'Product',
                            textcolor: Colors.grey,
                            textsize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        WSizedBox(wval: 0.1, hval: 0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const JoinPage()));
                          },
                          child: TextWidget(
                            text: 'Join',
                            textcolor: Colors.grey,
                            textsize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: ' START FOR FREE',
                              textcolor: Colors.grey,
                              textsize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextWidget(
                                  text: 'Login to your account',
                                  textcolor: Colors.white,
                                  textsize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  height: 10,
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: ' Not A member ?',
                          textcolor: Colors.grey,
                          textsize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationPage()));
                          },
                          child: TextWidget(
                            text: ' Sign up',
                            textcolor: Colors.blue,
                            textsize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 400,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    30,
                                    30,
                                    0,
                                    0,
                                  ),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      // mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        // const SizedBox(height: 20),
                                        emailField,
                                        const SizedBox(height: 20),
                                        passwordField,
                                        const SizedBox(height: 30),
                                        SizedBox(
                                            width: 150, child: loginButton),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const StartUpPage())));
        await storage.write(key: "uid", value: userCredential.user?.uid);
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        debugPrint(error.code);
      }
    }
  }
}
