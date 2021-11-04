class FoodItem {
  String? itemName;
  int? itemPrice;
  String? imgUrl;

  FoodItem({this.itemName, this.itemPrice, this.imgUrl});

  FoodItem.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    itemPrice = json['item_price'];
    imgUrl = json['img_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['item_price'] = this.itemPrice;
    data['img_url'] = this.imgUrl;
    return data;
  }
}
