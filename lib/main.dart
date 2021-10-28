import 'package:flutter/material.dart';
import 'package:canteenapp/screens/login_screen.dart';

void main() => runApp(MyApp());

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
