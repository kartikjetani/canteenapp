import 'package:canteenapp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  const LoginBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // backgroundColor: Colors.red[50],
          toolbarHeight: 0,
          // ignore: deprecated_member_use
          brightness: Brightness.light,
          shadowColor: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(248, 245, 242, 1),
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
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
                                color: kPrimaryColor,
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
                              color: kPrimaryColor,
                            )),
                      ),
                    ],
                  ),
                ),
                child
              ],
            ),
          ),
        ));
  }
}
