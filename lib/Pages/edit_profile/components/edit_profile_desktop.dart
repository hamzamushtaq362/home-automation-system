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

class EditProfileDesktop extends StatefulWidget {
  const EditProfileDesktop({Key? key}) : super(key: key);

  @override
  _EditProfileDesktopState createState() => _EditProfileDesktopState();
}

class _EditProfileDesktopState extends State<EditProfileDesktop> {
  TextEditingController nameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
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

    showLocalFile = true;
    setState(() {
      imageFile = tempImage;
    });

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

    showLocalFile = true;
    setState(() {
      imageFile = tempImage;
    });
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
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
      nameController.text = loggedInUser.firstName!;
      secondnameController.text = loggedInUser.secondName!;
      emailController.text = loggedInUser.email!;
      phoneController.text = loggedInUser.phone ?? 'Enter Contact no. ';
    });
    _getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: userModel == null
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: SizedBox(
                  width: 800,
                  child: Padding(
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
                              const Text(
                                'Edit Profile',
                                // style: Theme.of(context).textTheme.headline1,
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(25),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage: showLocalFile
                                        ? FileImage(imageFile!) as ImageProvider
                                        : userModel!.profileImage == ''
                                            ? const NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                                            : NetworkImage(userModel!
                                                .profileImage
                                                .toString())),
                              ),
                              IconButton(
                                icon: const Icon(Icons.camera_alt),
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
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
                                              leading:
                                                  const Icon(Icons.camera_alt),
                                              title: const Text('From Camera'),
                                              onTap: () {
                                                _pickImageFromCamera();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: nameController,
                                autofocus: false,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) {
                                  if (value!.isEmpty || value.trim().isEmpty) {
                                    return 'Name is required';
                                  }
                                  return null;
                                },
                                cursorColor: Colors.black12,
                                decoration: InputDecoration(
                                  hintText: 'First Name',

                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  icon: Container(
                                    height: 50,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // prefixIcon: Icon(Icons.person, size: 25, color: Colors.grey,),
                                  // contentPadding: EdgeInsets.only(left: 30),
                                  border: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                  ),
                                  enabled: true,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: secondnameController,
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty || value.trim().isEmpty) {
                                    return 'Username is required';
                                  }
                                  return null;
                                },
                                cursorColor: Colors.black12,
                                decoration: InputDecoration(
                                  hintText: 'Last Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  icon: Container(
                                    height: 50,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                  ),
                                  enabled: true,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: emailController,
                                autofocus: false,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty || value.trim().isEmpty) {
                                    return 'Email is required';
                                  }
                                  return null;
                                },
                                cursorColor: Colors.black12,
                                decoration: InputDecoration(
                                  hintText: 'abc@smart.com',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  icon: Container(
                                    height: 50,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    ),
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  enabled: true,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: phoneController,
                                autofocus: false,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty || value.trim().isEmpty) {
                                    return 'Phone no. is required';
                                  }
                                  return null;
                                },
                                cursorColor: Colors.black12,
                                decoration: InputDecoration(
                                  hintText: '0300 1234567',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  icon: Container(
                                    height: 50,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      Icons.phone_android,
                                      color: Colors.white,
                                    ),
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                  ),
                                  enabled: true,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Container(
                          height: getProportionateScreenHeight(40),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: InkWell(
                              child: const Text(
                                'Save Changes',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                sendData();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }

  sendData() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .update({
        'firstName': nameController.text,
        'secondName': secondnameController.text,
        'email': emailController.text,
        'phone': phoneController.text
      });
    }
  }
}
