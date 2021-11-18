import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/controllers/user_controller.dart';
import 'package:canteenapp/models/fooditem_model.dart';
import 'package:canteenapp/models/order_model.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseService {
  static CartController cartController = Get.find();
  static UserController userController = Get.find();
  var _path = '/orders/${userController.uid.value}/active_orders';

  DatabaseService() {
    if (userController.uid.value == "") {
      _path = '/orders/temp/active_orders';
    }
  }
  final CollectionReference foodItems =
      FirebaseFirestore.instance.collection('food_items');

// ${userController.uid.value.toString()}
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
    final CollectionReference activeOrders =
        FirebaseFirestore.instance.collection(_path);
    print(_path);

    return activeOrders.snapshots().map(_orderListFromSnapshot);
  }

  List<Order> _orderListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Order.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  void createNewOrder() {
    final CollectionReference activeOrders =
        FirebaseFirestore.instance.collection("active_orders");
    var cartItems = <Item>[];
    print(cartController.menuItems.value.toString());
    for (var e in cartController.menuItems.value) {
      if (e.quantity != 0) {
        cartItems.add(Item(itemName: e.itemName, quantity: e.quantity));
      }
    }

    var orderDoc =
        Order(items: cartItems, status: "REQ_SENT", timestamp: Timestamp.now())
            .toJson();
    orderDoc["uid"] = userController.uid.value;
    orderDoc["order_id"] = "3";
    print("${cartItems.toList()}");
    activeOrders.doc("3").set(orderDoc);
    print("document added");
  }
}
