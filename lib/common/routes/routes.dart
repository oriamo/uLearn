import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/routes/app_route_names.dart';
import 'package:shop_app/global.dart';
import 'package:shop_app/pages/application/home/view/home.dart';
import 'package:shop_app/pages/application/views/application.dart';
import 'package:shop_app/pages/sign_in/view/sign_in.dart';
import 'package:shop_app/pages/sign_up/view/sign_up.dart';
import 'package:shop_app/pages/welcome/view/Welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.Sign_Up, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.Home, page: const Home()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print("object is $settings");
    }

    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);



      if (result.isNotEmpty) {
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
        bool isLoggedIn = Global.storageService.isLoggedIn();

        print(deviceFirstTime);

        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
          bool isLoggedIn = Global.storageService.isLoggedIn();
          if (isLoggedIn){
            return MaterialPageRoute(
              builder: (_) => const Application(),settings: settings,);
          }else {
            return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings,);
          }
        } else {
          return MaterialPageRoute(
            builder: (_) => result.first.page,
            settings: settings,
          );
        }
      }
    }

    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}
