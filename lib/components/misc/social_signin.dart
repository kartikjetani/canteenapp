import 'package:canteenapp/components/misc/separator_with_text.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:flutter/material.dart';

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
                  onPressed: () {},
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
                    Authentication()
                        .signInWithGoogle()
                        .then((value) => print(value));
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
              //   Container(
              //     height: 40.0,
              //     width: size.width * 0.45,
              //     alignment: Alignment.centerLeft,
              //     child: Expanded(
              //       child: SignInButton(
              //         Buttons.Google,
              //         text: "Google",
              //         onPressed: () {},
              //         shape: new RoundedRectangleBorder(
              //           borderRadius: new BorderRadius.circular(8.0),
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ],
      ),
    );
  }
}
