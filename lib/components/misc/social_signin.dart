import 'package:canteenapp/components/misc/separator_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class GoogleFaceBookLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          SapratorWithTxt(),
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
                  onPressed: () {},
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
