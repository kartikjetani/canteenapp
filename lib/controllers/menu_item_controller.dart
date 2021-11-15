import 'package:canteenapp/models/fooditem_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MenuController extends GetxController {
  // List<FoodItem>  menuItems = <FoodItem>[].obs;
  // final menuItems = < FoodItem >[].obs;
  RxList<FoodItem> menuItems = RxList<FoodItem>([]);
  void onInit() {
    super.onInit();
    menuItems.bindStream(menuFromFirebase());
    print(menuItems);
  }

  Stream<List<FoodItem>> menuFromFirebase() {
    print("stream is on");
    Stream<QuerySnapshot> stream =
        FirebaseFirestore.instance.collection('food_items').snapshots();
    return stream.map((qShot) => qShot.docs
        .map((doc) => FoodItem(
              imgUrl: doc['imgUrl'],
              isAvail: doc['is_avail'],
              itemName: doc['item_name'],
              itemPrice: doc['itme_price'],
              // quantity: doc['quantity']
            ))
        .toList());
  }

  // List<FoodItem> fetchMenuFromFirebase(){
  //   snapshot.data!.docs.map((DocumentSnapshot document) {
  //     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
  //     return (data["is_avail"]) ? MenuItem(data: data,) : Container();}).toList(),
}
