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
      return array.reversed.toList();
    }

    return Obx(() => Column(
          children: activeOrderBuilder(),
        ));
  }
}

class OrderCard extends StatelessWidget {
  Map<String, dynamic>? data;
  OrderCard({Key? key, this.data}) : super(key: key);

  get style => null;

  void statusToIndex() {
    var _index = 0;
    switch (data!["status"]) {
      case "REQ_SENT":
        _index = 0;
        break;
      case "REQ_ACCEPTED":
        _index = 1;
        break;
      case "PAID":
        _index = 2;
        break;
      case "READY":
        _index = 3;
        break;
      case "DELIVERED":
        _index = 4;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> itemListBuilder() {
      var widgetArray = <Widget>[];
      for (var item in data!["items"]) {
        widgetArray.add(Container(
          width: size.width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${item["item_name"]} x ${item["quantity"]}"),
              Text("${item["item_price"] * item["quantity"]}")
            ],
          ),
        ));
      }
      return widgetArray;
    }

    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${data!["order_id"]}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700])),
                  Text(
                      "${DateTime.fromMillisecondsSinceEpoch(data!["timestamp"].seconds * 1000).toLocal().toString().substring(11, 16)} ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700])),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: itemListBuilder(),
                  ),
                  // Column(
                  //   children: [Text("25"), Text("56"), Text("88")],
                  // )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50, top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Column(
                children: [
                  Text("Total : ${data!["total_amount"]}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ]),
          ),
          StepperDemo(
            data: data,
          )
        ],
      ),
    );
  }
}
