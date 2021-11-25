import 'dart:convert';
import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/controllers/user_controller.dart';
import 'package:canteenapp/models/fooditem_model.dart';
import 'package:canteenapp/models/order_model.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DatabaseService {
  static CartController cartController = Get.find();
  static UserController userController = Get.find();

  static final CollectionReference activeOrders =
      FirebaseFirestore.instance.collection("active_orders");
  final CollectionReference foodItems =
      FirebaseFirestore.instance.collection('food_items');
  final DocumentReference counterRef =
      FirebaseFirestore.instance.doc("statistics/counter");

  Stream<List<FoodItem>> get menuItemsList {
    return foodItems.snapshots().map(_menuitemListFromSnapshot);
  }

  List<FoodItem> _menuitemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      FoodItem fi = FoodItem(
          imgUrl: doc['imgUrl'],
          itemName: doc['item_name'],
          itemPrice: doc['item_price'],
          quantity: 0,
          isAvail: doc['is_avail']);
      return fi;
    }).toList();
  }

  Stream<List<Order>> get orderList {
    return activeOrders.snapshots().map(_orderListFromSnapshot);
  }

  List<Order> _orderListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .where((element) => element['uid'] == userController.uid.value)
        .map((doc) {
      // print(doc.data());
      return Order.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  void createNewOrder() {
    var cartItems = <Item>[];
    print(cartController.menuItems.value.toString());
    for (var e in cartController.menuItems.value) {
      if (e.quantity != 0) {
        cartItems.add(Item(
            itemName: e.itemName,
            quantity: e.quantity,
            item_price: e.itemPrice));
      }
    }
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);

    var orderDoc =
        Order(items: cartItems, status: "REQ_SENT", timestamp: Timestamp.now())
            .toJson();
    orderDoc["uid"] = userController.uid.value;
    orderDoc["fcmtoken"] = userController.fcmtoken.value;
    orderDoc["user_name"] = Authentication.currentUser.displayName;
    orderDoc["total_amount"] = cartController.cartTotal.value;

    print("orderdoc fcmtoken: ${orderDoc["fcmtoken"]}");
    counterRef.get().then((DocumentSnapshot doc) {
      orderDoc["order_id"] =
          "${date.toString().substring(0, 10)}_${doc.get("order_counter") + 1}";
      print("order_counter: ${orderDoc["order_id"]}");

      counterRef.update({"order_counter": doc.get("order_counter") + 1});
      activeOrders.doc(orderDoc["order_id"]).set(orderDoc);
    });
    print("${cartItems.toList()}");
    print("document added");
  }

  void cancelOrder(String orderId) {
    activeOrders.doc(orderId).update({"status": "CANCELLED"});
    print("order cancelled");
  }

  static void pay(String orderid, int orderAmnt) async {
    print(Authentication.currentUser.phoneNumber);
    String orderId = orderid;
    String stage = "TEST";
    String orderAmount = orderAmnt.toString();
    String tokenData = "";
    String customerName = Authentication.currentUser.displayName;
    // String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "108964889a1bc4bedb7fc9a545469801";
    String customerPhone = "0123456789";
    String customerEmail = Authentication.currentUser.email;
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };

    var headers = {
      'x-client-id': '108964889a1bc4bedb7fc9a545469801',
      'x-client-secret': '132305ce67524993b7eff32e72815eb112acbc41',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('https://test.cashfree.com/api/v2/cftoken/order'));
    request.body = json.encode(
        {"orderId": orderid, "orderAmount": orderAmnt, "orderCurrency": "INR"});
    request.headers.addAll(headers);

    request.send().then((result) async {
      var resJson;
      http.Response.fromStream(result).then((response) {
        if (response.statusCode == 200) {
          print("Uploaded! ");
          resJson = jsonDecode(response.body) as Map<String, dynamic>;
          print("response" + resJson.toString());
          inputParams["tokenData"] = resJson["cftoken"];
          CashfreePGSDK.doPayment(inputParams).then((value) {
            print(value.toString());
            value?.forEach((key, value) {
              print("$key : $value");
              if (key == "txStatus" && value == "SUCCESS") {
                activeOrders.doc(orderid).update({"status": "PAID"});
              }
            });
          });
        }
      });
    }).catchError((err) => print('error : ' + err.toString()));
  }
}
