import 'package:canteenapp/components/social_signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 245, 242, 1),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: size.height * 0.15,
                width: size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: -7,
                      left: -50,
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 30,
                              color: Color.fromRGBO(232, 76, 79, 1),
                            ),
                            shape: BoxShape.circle,
                          )),
                    ),
                    Positioned(
                      top: -100,
                      left: -30,
                      child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(250, 222, 223, 1),
                          )),
                    ),
                    Positioned(
                      top: -70,
                      right: -70,
                      child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(232, 76, 79, 1),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.8,
                child: Text("Sign Up",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        decoration: TextDecoration.none)),
              ),
              Container(
                child: GoogleFaceBookLogin(),
              )
            ],
          ),
        ));
  }
}
