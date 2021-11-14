class FoodItem {
  String? itemName;
  int? itemPrice;
  String? imgUrl;
  int? quantity = 0;
  bool? isAvail;
  FoodItem({this.itemName, this.itemPrice, this.imgUrl, this.quantity, this.isAvail});

  FoodItem.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    itemPrice = json['item_price'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['item_price'] = this.itemPrice;
    data['imgUrl'] = this.imgUrl;
    data['quantity']  = this.quantity;
    data['is_avail'] = this.isAvail;
    return data;
  }
}
