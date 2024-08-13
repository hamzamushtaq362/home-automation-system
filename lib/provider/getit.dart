import 'package:get_it/get_it.dart';
import 'package:smart_home/model_view_controller/home_view_model.dart';
import 'package:smart_home/model_view_controller/smart_ac_view_model.dart';
import 'package:smart_home/model_view_controller/smart_fan_view_model.dart';
import 'package:smart_home/model_view_controller/smart_light_view_model.dart';
import 'package:smart_home/model_view_controller/smart_speaker_view_model.dart';
import 'package:smart_home/services/navigation_service.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => HomeScreenViewModel());
  getIt.registerFactory(() => SmartLightViewModel());
  getIt.registerFactory(() => SmartFanViewModel());
  getIt.registerFactory(() => SmartACViewModel());
  getIt.registerFactory(() => SmartSpeakerViewModel());
}
