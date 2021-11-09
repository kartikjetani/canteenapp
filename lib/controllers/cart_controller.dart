import 'package:canteenapp/models/fooditem_model.dart';
import 'package:canteenapp/utils/database.dart';
import 'package:get/get.dart';


class CartController extends GetxController {
  final cartItems = <FoodItem>[].obs;

  void onInit(){
     // cartItems.bindStream(DatabaseService().menuItemsList);
     print(" cartitems: $cartItems");
    super.onInit();
  }


  void add(Map<dynamic, dynamic> foodItem) {

    for(var item in cartItems){
        if(item.itemName.toString() == foodItem['item_name'].toString()){
            item.quantity = foodItem['quantity'];
            return;
        }
    }

    FoodItem fi = FoodItem(
        quantity: foodItem["quantity"],
        itemPrice: foodItem["item_price"],
        itemName: foodItem["item_name"],
        imgUrl: foodItem["imgUrl"],
        isAvail: foodItem["is_avail"]
    );
    cartItems.add(fi);
  }
}