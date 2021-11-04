import 'dart:convert';

import 'package:canteenapp/models/userdata_model.dart';
import 'package:canteenapp/screens/home_screen.dart';
import 'package:canteenapp/screens/login_screen.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController extends GetxController {
  static final userbox = GetStorage("User");
  var uid = "".obs;
  var item_count = 0.obs;

  increaseCount() {
    item_count += 1;
  }

  decreaseCount() {
    item_count -= 1;
  }

  initialize() {
    var temp = userbox.read("uid");
    if (temp != null) {
      uid.value = temp;
      print("init");
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      users.doc(uid.value).get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;
          var items = data["cart"][0];
          items.get().then((DocumentSnapshot snap) {
            print('Document data: ${snap.data()}');
          });
        } else {
          print('Document does not exist on the database');
        }
      });
    }
  }

  signInGoogle() {
    // Authentication.signInWithGoogle();
    // Get.to(HomeScreen());
  }

  signInFb() {
    // Authentication.signInWithFacebook().then((value) {
    //    userInfo.value = value.toString();
    //   print(userInfo.value);
    // });
  }

  signOut() {
    Authentication.signOut();
  }
}
