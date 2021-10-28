import 'package:flutter/material.dart';
import 'package:canteenapp/screens/login_screen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(248, 245, 242, 1)));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          // primaryColor: kPrimaryColor,
          // scaffoldBackgroundColor: Colors.white,
          ),
      home: LoginScreen(),
    );
  }
}
