import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:smart_home/database/gateway.dart';
import 'package:smart_home/provider/base_model.dart';

class HomeScreenViewModel extends BaseModel {
  //-------------VARIABLES-------------//
  int selectedIndex = 1;
  int randomNumber = 1;
  final PageController pageController = PageController();
  bool lisLightOn1 = false;
  bool lisLightOn2 = false;
  bool lisLightOn3 = false;
  bool lisFanON = false;
  /////// drawing room
  bool disAcON = false;
  bool disLightOn1 = false;
  bool disLightOn2 = false;
  bool disLightOn3 = false;
  bool disSpeaker = false;
//////// kitchen
  bool kisLightOn1 = false;
  bool kisLightOn2 = false;
  bool kisFanON = false;
  void generateRandomNumber() {
    randomNumber = Random().nextInt(8);
    notifyListeners();
  }

  void lightSwitch1() async {
    lisLightOn1 = !lisLightOn1;
    notifyListeners();

    if (lisLightOn1 == true) {
      lightDatabase1.set({
        'status': '0',
      });
    } else {
      lightDatabase1.set({
        'status': '1',
      });
    }
  }

  void lightSwitch2() {
    lisLightOn2 = !lisLightOn2;
    notifyListeners();
    if (lisLightOn2 == true) {
      lightDatabase2.set({
        'status': '0',
      });
    } else {
      lightDatabase2.set({
        'status': '1',
      });
    }
  }

  void lightSwitch3() {
    lisLightOn3 = !lisLightOn3;
    notifyListeners();
    if (lisLightOn3 == true) {
      lightDatabase3.set({
        'status': '0',
      });
    } else {
      lightDatabase3.set({
        'status': '1',
      });
    }
  }

  void fanSwitch() {
    lisFanON = !lisFanON;
    notifyListeners();
    if (lisFanON == true) {
      fanDatabase1.set({
        'status': '0',
      });
    } else {
      fanDatabase1.set({
        'status': '1',
      });
    }
  }

  //////  drawing

  void dlightSwitch1() async {
    disLightOn1 = !disLightOn1;
    notifyListeners();
  }

  void dlightSwitch2() async {
    disLightOn2 = !disLightOn2;
    notifyListeners();
  }

  void dlightSwitch3() async {
    disLightOn3 = !disLightOn3;
    notifyListeners();
  }

  void dacSwitch() {
    disAcON = !disAcON;
    notifyListeners();
  }

  void dSpeakerSwitch() {
    disSpeaker = !disSpeaker;
    notifyListeners();
  }

  //////// ketchen
  void klightSwitch1() async {
    kisLightOn1 = !kisLightOn1;
    notifyListeners();
  }

  void klightSwitch2() async {
    kisLightOn2 = !kisLightOn2;
    notifyListeners();
  }

  void kfanSwitch() {
    kisFanON = !kisFanON;
    notifyListeners();
  }
}
