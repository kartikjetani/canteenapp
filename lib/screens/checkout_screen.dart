import 'package:canteenapp/components/menu_item_card.dart';
import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CheckoutScreen extends StatelessWidget {

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    // print(" cartcontroller from checkout page ${cartController.cartItems.value}");
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Obx(() => ListView.builder(
          itemCount: cartController.cartItems.value.length,
          itemBuilder: (context, index){
            return MenuItem(data:  cartController.cartItems[index].toJson());
      })),
    );
  }
}
