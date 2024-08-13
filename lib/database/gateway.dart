import 'package:firebase_database/firebase_database.dart';
import 'package:smart_home/database/appliencs_address.dart';

final _database = FirebaseDatabase.instance.ref();

// lights
final lightDatabase1 = _database.child(light1);
final lightDatabase2 = _database.child(light2);
final lightDatabase3 = _database.child(light3);
// fan con
final fanDatabase1 = _database.child(fan1);
//
final routOftemp = _database.child(temperature);
final routOfhum = _database.child(humidity);
