import 'package:canteenapp/components/misc/already_have_account.dart';
import 'package:canteenapp/components/login_background.dart';
import 'package:canteenapp/components/password_input_box.dart';
import 'package:canteenapp/components/primary_btn_red.dart';
import 'package:canteenapp/components/misc/social_signin.dart';
import 'package:canteenapp/components/text_input_box.dart';
import 'package:canteenapp/screens/login_screen.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  var email;
  var password;
  String fullName = "user";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width * 0.8,
            child: Text("Sign Up",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    decoration: TextDecoration.none)),
          ),
          SizedBox(
            height: 12,
          ),
          MyInputBox(
            label: "Full name",
            hintText: "Hohn Doe",
            onChanged: (val) {
              fullName = val;
            },
          ),
          SizedBox(
            height: 15,
          ),
          MyInputBox(
            label: "Email",
            hintText: "Your Email id",
            onChanged: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 15,
          ),
          PasswordInput(onChanged: (val) {
            password = val;
          }),
          SizedBox(
            height: 15,
          ),
          PrimaryBtn(
              child: Text("SIGN UP"),
              onPressed: () {
                Authentication.SignUp(email, password, fullName);
              }),
          SizedBox(height: 5),
          AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Get.to(() => LoginScreen());
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
