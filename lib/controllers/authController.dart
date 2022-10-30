import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jkuat_navigation/models/account.dart';
import 'package:jkuat_navigation/pages/home.dart';
import 'package:jkuat_navigation/services/user.dart';
import 'package:jkuat_navigation/utilities/loader.dart';
import 'package:jkuat_navigation/utilities/toastDialog.dart';

import '../utilities/appconfig.dart';

class AuthController {
  static registerNewUser(
      BuildContext context, Account account, String password) async {
    try {
      Loader().showCustomDialog(context, "Registering");
      UserCredential userCredential = await AppConfig.auth
          .createUserWithEmailAndPassword(
              email: account.email, password: password);

      //redefining User object and assign User ID from the Auth
      Account visitor = Account(
          id: userCredential.user!.uid,
          name: account.name,
          email: account.email,
          phone: account.phone,
          image: account.image);
      // saving user data to database
      UserServices userServices = UserServices();
      userServices.registerUser(visitor);

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const HomePage(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    } catch (e) {
      ToastDialogue().showToast("Error: $e", 1);
    }
  }

  static loginUser(BuildContext context, String email, String password) async {
    try {
      Loader().showCustomDialog(context, "Signing in...");
      final UserCredential userCredential = (await AppConfig.auth
          .signInWithEmailAndPassword(email: email, password: password));

      if (kDebugMode) {
        print(userCredential.user!.email);
      }
      // ignore: use_build_context_synchronously
      ToastDialogue().showToast("Success", 0);
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const HomePage(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    } catch (e) {
      ToastDialogue().showToast("Error: $e", 1);
    }
  }

  static Future<Account> getUserAccount(String uid) async {
    UserServices userServices = UserServices();
    return userServices.getUserById(uid);
  }
}
