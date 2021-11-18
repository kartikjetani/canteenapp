import 'package:canteenapp/components/menu_item_card.dart';
import 'package:canteenapp/components/primary_btn_red.dart';
import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/screens/home_screen.dart';
import 'package:canteenapp/utils/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(
        " cartcontroller from checkout page ${cartController.menuItems.value}");
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
                itemCount: cartController.menuItems.value.length,
                itemBuilder: (context, index) {
                  return cartController.menuItems[index].quantity != 0
                      ? MenuItem(data: cartController.menuItems[index].toJson())
                      : Container();
                })),
            PrimaryBtn(
                onPressed: () {
                  DatabaseService().createNewOrder();
                },
                child: Text("Confirm Order"))
          ],
        ),
      ),
    );
  }
}
