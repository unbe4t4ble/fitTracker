import 'package:fit_tracker/enum/view_state.dart';
import 'package:fit_tracker/provider/get_it.dart';
import 'package:fit_tracker/service/navigation_service.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = getIt<NavigationService>();
  ViewState _state = ViewState.idle;

  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}