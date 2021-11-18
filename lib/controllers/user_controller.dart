import 'package:canteenapp/models/fooditem_model.dart';
import 'package:canteenapp/models/order_model.dart';
import 'package:canteenapp/models/userdata_model.dart';
import 'package:canteenapp/screens/home_screen.dart';
import 'package:canteenapp/screens/login_screen.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:canteenapp/utils/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController extends GetxController {
  var uid = "".obs;
  var activeOrderList = <Order>[].obs;

  void onInit() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        uid.value = "";
      } else {
        print('User is signed in!');
        uid.value = user.uid;
        DatabaseService dbs = DatabaseService();
        activeOrderList.bindStream(dbs.orderList);
      }
    });
    super.onInit();
  }

  void temp() {
    final CollectionReference orderRef =
        FirebaseFirestore.instance.collection("orders");
    var objArray = <Map<String, dynamic>>[];

    orderRef.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var obj = Map<String, dynamic>();

        orderRef
            .doc(doc.id)
            .collection("active_orders")
            .get()
            .then((querySnapshot) => querySnapshot.docs.forEach((e) {
                  obj = e.data();
                  obj["username"] = doc.get("user_name");
                  print("${obj.toString()}");
                }));

        objArray.add(obj);
      });
    });
  }
}
