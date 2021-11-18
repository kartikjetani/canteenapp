import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  List<Item>? items;
  Timestamp? timestamp;
  String? uid;
  String? status;
  String? orderid;
  String? userName;
  int? totalAmount;

  Order(
      {this.items,
      this.timestamp,
      this.status,
      this.uid,
      this.orderid,
      this.userName,
      this.totalAmount});

  Order.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(new Item.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
    status = json['status'];
    uid = json['uid'];
    orderid = "${json["order_id"]}";
    userName = json["user_name"];
    totalAmount = json["total_amount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = this.timestamp;
    data['status'] = this.status;
    data['uid'] = this.uid;
    data['order_id'] = this.orderid;
    data['user_name'] = this.userName;
    data['total_amount'] = this.totalAmount;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    // print("items: [${items.toString()}],status: $status");
    return "items: ${items.toString()},status: $status,uid: ${uid}, order_id:${orderid},user_name:${userName}";
  }
}

class Item {
  String? itemName;
  int? quantity;

  Item({this.itemName, this.quantity});

  Item.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['quantity'] = this.quantity;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    // print("{item_name:${itemName},quantity: $quantity}");
    return "{item_name:${itemName},quantity: $quantity}";
  }
}
