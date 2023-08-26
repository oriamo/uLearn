
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/common/loader/global_loader.dart';
import 'package:shop_app/common/utils/constants.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/pages/sign_in/repo/Sign_in_repo.dart';
import '../../../common/models/user.dart';
import '../../../common/widgets/popup_messages.dart';
import '../../../global.dart';
import '../provider/sign_in_notifier.dart';
//the sign in controller controls the sign in process
class SignInController {
  //WidgetRef ref;
  SignInController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> handelSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);

    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email field is empty");
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      toastInfo("Your password field is empty");
      return;
    }


    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credential = await SignInRepo.firebaseSignIn(email, password);

      if (credential.user == null) {
        toastInfo("user not found");
      }
      if (credential.user!.emailVerified) {
        toastInfo("user email not verfied");
      }

      var user = credential.user;

      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;



        asyncPostAllData(loginRequestEntity);


        print("user loged in");
      } else {
        toastInfo("Log in Error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo("This password is too weak");
      } else if (e.code == 'wrong-password') {
        toastInfo("the password provided is incorrect");
      } else if (e.code == 'user-not-found') {
        toastInfo("User not found");
      }
      if (kDebugMode) {
        print(e.code);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    // talk to server
    //local server
    try {
      //remember the user info
      Global.storageService.setString(
          AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode({
        'name': 'Dara', 'email': 'adewoledarasimi25@gmail.com', 'age': 21
      }));
      Global.storageService.setString(
          AppConstants.STORAGE_USER_TOKEN_KEY, "123456");
      navKey.currentState?.pushNamedAndRemoveUntil(
          "/application", (route) => false);
      print("we got here");
    } catch (e) {
      if (kDebugMode) {
       print(e.toString());
      }
    }
    //redirect to new page

  }
}


