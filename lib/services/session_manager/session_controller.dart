import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/model/user/user_model.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/services/storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLoggedIn;

  SessionController._internal() {
    isLoggedIn = false;
  }

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLoggedIn', 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.readValue('token');
      var isLoggedIn = await localStorage.readValue('isLoggedIn');

      if (userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(userData);
      }
      SessionController().isLoggedIn = isLoggedIn == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
