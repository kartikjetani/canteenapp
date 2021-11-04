import 'dart:async';
import 'package:canteenapp/controllers/user_controller.dart';
import 'package:canteenapp/models/userdata_model.dart';
import 'package:canteenapp/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_storage/get_storage.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  static final userbox = GetStorage("User");
  static UserController userController = Get.find();

  Future<bool> isSignIn() async {
    final completer = Completer<bool>();
    _auth.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        completer.complete(false);
      } else {
        print('User is signed in!');
        completer.complete(true);
      }
    });
    return completer.future;
  }

  // ignore: non_constant_identifier_names
  Future<String> SignIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // print("credentials: " + userCredential.toString());
      return "SUCCESS";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return "USER_NOT_FOUND";
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return "WRONG_PASS";
      } else {
        return "ERROR";
      }
    }
  }

  // ignore: non_constant_identifier_names
  Future SignUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    Userdata userdata;
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      print("uid: ${value.user!.uid}");
      userbox.write("uid", value.user!.uid);
      // Get.offAll(() => HomeScreen());
    });
  }

  static Future<String?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    print("message : " + result.status.toString());
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      final userData = await FacebookAuth.instance.getUserData();
      return userData.toString();
    }
    return null;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    userbox.write("isLoggedin", false);
    userbox.write("uid", "");
    print("signed out");
  }
}
