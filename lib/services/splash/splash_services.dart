import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/services/session_manager/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {

    SessionController().getUserFromPreference().then((value){
      if(SessionController().isLoggedIn ??false) {
        Timer(
            const Duration(seconds: 3),
                () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.homeScreen, (route) => false));
      } else {
        Timer(
            const Duration(seconds: 3),
                () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.loginScreen, (route) => false));
      }
    }).onError((error, stackTrace){
      Timer(
          const Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.loginScreen, (route) => false));
    });


  }
}
