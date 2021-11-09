import 'package:canteenapp/controllers/user_controller.dart';
import 'package:canteenapp/models/userdata_model.dart';
import 'package:canteenapp/screens/home_screen.dart';
import 'package:canteenapp/screens/login_screen.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:canteenapp/utils/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'models/fooditem_model.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(248, 245, 242, 1)));
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return SomethingWentWrong();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Loading();
    }

    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    userController.initialize();
    print(userController.uid.value);

    return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Auth',
          theme: ThemeData(
            // primaryColor: kPrimaryColor,
            // scaffoldBackgroundColor: Colors.white,
          ),
          home: HomeScreen());
    //  (userController.uid.value != "") ? HomeScreen() : LoginScreen());
  }
}

// Extra widgets
class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Something went wrong..",
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Loading...",
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
//  StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.hasData) {
//               return HomeScreen();
//             } else {
//               return LoginScreen();
//             }
//           }),