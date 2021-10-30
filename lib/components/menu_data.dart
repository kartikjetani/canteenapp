import 'package:flutter/material.dart';

class DataOfMenu {
  String? imgUrl;
  String? Name;
  double? price;

  //DataOfMenu({this.imgUrl, this.Name, this.price});
  DataOfMenu(String img, String name, double price){
    this.imgUrl = img;
    this.Name = name;
    this.price = price;
  }
}
