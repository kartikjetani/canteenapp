import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/screens/checkout_screen.dart';
import 'package:canteenapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutBtn extends StatelessWidget {
  CartController cartController;
  CheckoutBtn({Key? key, required this.cartController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          height: (cartController.totalQty.value != 0) ? 50 : 0,
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: RawMaterialButton(
              child: Container(
                height: 50,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "${cartController.totalQty} item",
                      textAlign: TextAlign.left,
                    )),
                    Expanded(
                        child: Text(
                      "Chekout",
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: Text(
                      "Rs. ${cartController.cartTotal}",
                      textAlign: TextAlign.right,
                    )),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ),
              fillColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                Get.off(
                  () => CheckoutScreen(),
                );
              }),
        ));
  }
}
