import 'package:canteenapp/models/fooditem_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference food_items =
      FirebaseFirestore.instance.collection('food_items');

  Stream<List<FoodItem>> get menuItemsList {
    return food_items.snapshots().map(_menuitemListFromSnapshot);
  }

  List<FoodItem> _menuitemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      FoodItem fi = FoodItem(
          imgUrl: doc['imgUrl'],
          itemName: doc['item_name'],
          itemPrice: doc['item_price'],
          quantity: 0,
          isAvail: doc['is_avail']
      );
      return fi;
    }).toList();
  }
}
