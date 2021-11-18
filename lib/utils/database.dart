import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/controllers/user_controller.dart';
import 'package:canteenapp/models/fooditem_model.dart';
import 'package:canteenapp/models/order_model.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class DatabaseService {
  static CartController cartController = Get.find();
  static UserController userController = Get.find();

  final CollectionReference activeOrders =
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
        cartItems.add(Item(itemName: e.itemName, quantity: e.quantity));
      }
    }
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);

    var orderDoc =
        Order(items: cartItems, status: "REQ_SENT", timestamp: Timestamp.now())
            .toJson();
    orderDoc["uid"] = userController.uid.value;
    orderDoc["user_name"] = Authentication.currentUser.displayName;
    orderDoc["total_amount"] = cartController.cartTotal.value;

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
}
