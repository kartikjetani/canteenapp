import 'package:canteenapp/components/menu_item_card.dart';
import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(
        " cartcontroller from checkout page ${cartController.cartItems.value}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(HomeScreen());
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Obx(() => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cartController.cartItems.value.length,
                itemBuilder: (context, index) {
                  return cartController.cartItems[index].quantity != 0
                      ? MenuItem(data: cartController.cartItems[index].toJson())
                      : Container();
                })),
          ],
        ),
      ),
    );
  }
}
