import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/core/base_state/base_state.dart';

class BaseViewModel extends ChangeNotifier {
  BaseState state = LoadingState();

  void emit(BaseState newState) {
    state = newState;
    notifyListeners();
  }
}
