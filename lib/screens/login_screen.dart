import 'package:canteenapp/components/misc/already_have_account.dart';
import 'package:canteenapp/components/login_background.dart';
import 'package:canteenapp/components/password_input_box.dart';
import 'package:canteenapp/components/primary_btn_red.dart';
import 'package:canteenapp/components/misc/social_signin.dart';
import 'package:canteenapp/components/text_input_box.dart';
import 'package:canteenapp/screens/home_screen.dart';
import 'package:canteenapp/screens/signup_screen.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = "";
  var password = "";
  String _mailerror = "";
  String _passerror = "";

  void showError(value) {
    setState(() {
      if (value == "WRONG_PASS") {
        _passerror = "wrong password";
        _mailerror = "";
      } else if (value == "USER_NOT_FOUND") {
        _mailerror = "email not found";
        _passerror = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
        child: Container(
      height: size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.8,
            child: Text("Login",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    decoration: TextDecoration.none)),
          ),
          SizedBox(
            height: 30,
          ),
          MyInputBox(
            label: "Email",
            hintText: "Your Email id",
            onChanged: (val) {
              _mailerror = "";
              email = val;
            },
          ),
          Container(
            height: 15,
            width: size.width * 0.8,
            child: Text(
              _mailerror,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.red),
            ),
          ),
          PasswordInput(onChanged: (val) {
            _passerror = "";
            password = val;
          }),
          Container(
            height: 25,
            width: size.width * 0.8,
            child: Text(
              _passerror,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.red),
            ),
          ),
          PrimaryBtn(
            child: Text("LOGIN"),
            onPressed: () {
              Authentication().SignIn(email, password).then((value) {
                if (value == "SUCCESS") {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                }
                showError(value);
              });
            },
          ),
          SizedBox(height: 25),
          AlreadyHaveAnAccountCheck(
              login: true,
              press: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              }),
          SizedBox(height: 15),
          Container(
            child: GoogleFaceBookLogin(),
          )
        ],
      ),
    ));
  }
}
