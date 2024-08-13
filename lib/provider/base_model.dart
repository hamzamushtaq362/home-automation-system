
import 'package:flutter/material.dart';
import 'package:smart_home/enum/view_state.dart';
import 'package:smart_home/services/navigation_service.dart';
import 'getit.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = getIt<NavigationService>();
  ViewState _state = ViewState.idle;

  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
