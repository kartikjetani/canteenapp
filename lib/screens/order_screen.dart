import 'package:canteenapp/components/misc/stepper.dart';
import 'package:canteenapp/controllers/user_controller.dart';
import 'package:canteenapp/utils/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    // userController.temp();

    List<Widget> activeOrderBuilder() {
      var array = <Widget>[];
      for (var item in userController.activeOrderList.value) {
        array.add(OrderCard(data: item.toJson()));
      }
      return array;
    }

    return Obx(() => Column(
          children: activeOrderBuilder(),
        ));
  }
}

class OrderCard extends StatelessWidget {
  Map<String, dynamic>? data;
  OrderCard({Key? key, this.data}) : super(key: key);

  List<Widget> itemListBuilder() {
    var widgetArray = <Widget>[];
    for (var item in data!["items"]) {
      widgetArray.add(Text("${item["item_name"]} x ${item["quantity"]}"));
    }
    return widgetArray;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
              "OrderId: ${data!["order_id"]}    total: ${data!["total_amount"]}"),
          SizedBox(
            height: 20,
          ),
          Column(
            children: itemListBuilder(),
          ),
          SizedBox(
            height: 20,
          ),
          Text("status: ${data!["status"]}"),
          StepperDemo(status: data!["status"])
        ],
      ),
    );
  }
}
