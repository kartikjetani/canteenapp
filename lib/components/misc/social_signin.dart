import 'package:canteenapp/components/misc/separator_with_text.dart';
import 'package:canteenapp/controllers/user_controller.dart';
import 'package:canteenapp/models/userdata_model.dart';
import 'package:canteenapp/screens/home_screen.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GoogleFaceBookLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          SapratorWithTxt(
            text: 'Sign in with',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: size.width * 0.40,
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    // Authentication.signInWithFacebook()
                    //     .then((value) => print("usercred:" + value.toString()));
                  },
                  child: SizedBox(
                    height: 50.0,
                    child: Row(
                      children: [
                        Image(image: AssetImage("assets/images/facebook.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Facebook",
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.40,
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Authentication.signInWithGoogle();
                  },
                  child: SizedBox(
                    height: 50.0,
                    child: Row(
                      children: [
                        Image(image: AssetImage("assets/images/google.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Google",
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
                ),
              ),
              // Container(
              //   height: 40.0,
              //   width: size.width * 0.45,
              //   alignment: Alignment.centerLeft,
              //   child: Expanded(
              //     child: SignInButton(
              //       Buttons.Facebook,
              //       text: "Facebook",
              //       onPressed: () {},
              //       shape: new RoundedRectangleBorder(
              //         borderRadius: new BorderRadius.circular(8.0),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
