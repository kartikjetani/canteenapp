class FoodItem {
  String? itemName;
  double? itemPrice;
  int? quantity;
  String? imgUrl;
  bool? isAvailable;

  FoodItem(
      {this.itemName,
        this.itemPrice,
        this.quantity,
        this.imgUrl,
        this.isAvailable});

  FoodItem.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    itemPrice = json['itemPrice'];
    quantity = json['quantity'];
    imgUrl = json['imgUrl'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemName'] = this.itemName;
    data['itemPrice'] = this.itemPrice;
    data['quantity'] = this.quantity;
    data['imgUrl'] = this.imgUrl;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}