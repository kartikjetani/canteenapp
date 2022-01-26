import 'package:canteenapp/components/menu_item_card.dart';
import 'package:canteenapp/components/misc/stepper.dart';
import 'package:canteenapp/components/primary_btn_red.dart';
import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/screens/home_screen.dart';
import 'package:canteenapp/screens/order_screen.dart';
import 'package:canteenapp/utils/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Widget> activeOrderBuilder() {
      var array = <Widget>[];
      for (var item in cartController.menuItems.value) {
        if (item.quantity != 0) {
          array.add(MenuItem(data: item.toJson()));
        }
      }
      return array;
    }

    print(
        " cartcontroller from checkout page ${cartController.menuItems.value}");
    return Scaffold(
        appBar: AppBar(
          backwardsCompatibility: false,
          backgroundColor: Colors.white,
          title: Text(
            "Checkout",
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: Color.fromRGBO(62, 68, 98, 1)),
          ),
          leading: IconButton(
            color: Color.fromRGBO(62, 68, 98, 1),
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.off(HomeScreen());
            },
          ),
        ),
        bottomNavigationBar: PrimaryBtn(
            onPressed: () {
              DatabaseService().createNewOrder();
              cartController.reset();
              Get.off(HomeScreen());
            },
            child: Text(
              "Confirm Order",
            )),
        body:  Obx(() => ListView(
                children: activeOrderBuilder(),
              ),
        ));
  }
}
