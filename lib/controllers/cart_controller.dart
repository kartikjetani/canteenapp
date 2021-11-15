import 'package:canteenapp/models/fooditem_model.dart';
import 'package:canteenapp/utils/database.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <FoodItem>[].obs;
  var cartTotal = 0.obs;
  var totalQty = 0.obs;

  DatabaseService dbs = DatabaseService();
  void onInit() {
    cartItems.bindStream(dbs.menuItemsList);
    print(" cartitems: $cartItems");
    super.onInit();
  }

  void add(Map<dynamic, dynamic> foodItem) {
    print("add of cartController is working!!!");
    for (var item in cartItems) {
      if (item.itemName.toString() == foodItem['item_name'].toString()) {
        item.quantity = foodItem['quantity'];
        return;
      }
    }
    FoodItem fi = FoodItem(
        quantity: foodItem["quantity"],
        itemPrice: foodItem["item_price"],
        itemName: foodItem["item_name"],
        imgUrl: foodItem["imgUrl"],
        isAvail: foodItem["is_avail"]);
    cartItems.add(fi);
  }

  void increament(Map<dynamic, dynamic> foodItem) {
    for (var item in cartItems) {
      if (item.itemName.toString() == foodItem['item_name'].toString()) {
        print("Before: ");
        for (var i in cartItems) {
          print("${i.itemName} quantity : ${i.quantity} ");
        }
        item.quantity = foodItem['quantity'];
        print("${foodItem["item_name"]} cnt is updated to ${item.quantity}");
        print("After ");
        for (var i in cartItems) {
          print("${i.itemName} quantity : ${i.quantity} ");
        }
        calculateTotal();

        return;
      }
    }
  }

  void calculateTotal() {
    int totalPrice = 0;
    int totalQty = 0;

    for (var item in cartItems) {
      if (item.quantity != 0) {
        totalPrice += (item.itemPrice! * item.quantity!);
        totalQty += item.quantity!;
      }
    }
    print("cart total : ${cartTotal.value}");
    cartTotal.value = totalPrice;
    this.totalQty.value = totalQty;
  }
}
