// RoomPage
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/database/appliencs_address.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  bool isLightOn1 = false;

  final _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _activeListeners();
  }

  void _activeListeners() {
    _database.child(light1).child('status').onValue.listen((event) {
      final Object? stateOflight = event.snapshot.value;
      setState(() {
        String a = '$stateOflight';
        if (a == '0') {
          isLightOn1 = true;
        } else {
          isLightOn1 = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ));
  }
}
