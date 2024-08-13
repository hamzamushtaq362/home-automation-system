import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/models/user_model.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  User? user;
  UserModel? userModel;
  DatabaseReference? userRef;

  File? imageFile;
  bool showLocalFile = false;

  _getUserDetails() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data());
      setState(() {});
    });

    // DatabaseEvent snapshot = await userRef!.once();
    // userModel = UserModel.fromMap(Map<String, dynamic>.from(snapshot.value));
    
  }

  _pickImageFromGallery() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {});

    // upload to firebase storage

    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try {
      var fileName = userModel!.email! + '.jpg';

      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName)
          .putFile(imageFile!);

      TaskSnapshot snapshot = await uploadTask;

      String profileImageUrl = await snapshot.ref.getDownloadURL();

      // ignore: avoid_print
      print("this on is $profileImageUrl");
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .update({
        'profileImage': profileImageUrl,
      });
      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();

      // ignore: avoid_print
      print(e.toString());
    }
  }

  _pickImageFromCamera() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {});
    // upload to firebase storage

    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try {
      var fileName = userModel!.email! + '.jpg';

      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName)
          .putFile(imageFile!);

      TaskSnapshot snapshot = await uploadTask;

      String profileImageUrl = await snapshot.ref.getDownloadURL();

      // ignore: avoid_print
      print("this on is $profileImageUrl");
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .update({
        'profileImage': profileImageUrl,
      });
      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();

      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userRef = FirebaseDatabase.instance.ref().child('users').child(user!.uid);
    }

    _getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: userModel == null
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                  // top: getProportionateScreenHeight(15),
                  right: getProportionateScreenWidth(20),
                  bottom: getProportionateScreenHeight(15),
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                          const Spacer(),
                          const Text(
                            'Edit Profile',
                            // style: Theme.of(context).textTheme.headline1,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 80,
                            backgroundImage: showLocalFile
                                ? FileImage(imageFile!) as ImageProvider
                                : userModel!.profileImage == ''
                                    ? const NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                                    : NetworkImage(
                                        userModel!.profileImage.toString())),
                        IconButton(
                          icon: const Icon(Icons.camera_alt),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.image),
                                          title: const Text('From Gallery'),
                                          onTap: () {
                                            _pickImageFromGallery();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.camera_alt),
                                          title: const Text('From Camera'),
                                          onTap: () {
                                            _pickImageFromCamera();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ));
  }
}
