import 'package:canteenapp/controllers/user_controller.dart';
import 'package:canteenapp/utils/constants.dart';
import 'package:canteenapp/utils/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StepperDemo extends StatelessWidget {
  int index = 0;
  Map<String, dynamic>? data;
  UserController userController = Get.find();

  StepperDemo({this.data});

  @override
  Widget build(BuildContext context) {
    switch (data!["status"]) {
      case "REQ_SENT":
        index = 0;
        break;
      case "REQ_ACCEPTED":
        index = 1;
        break;
      case "PAID":
        index = 2;
        break;
      case "READY":
        index = 3;
        break;
      case "DELIVERED":
        index = 4;
        break;
      case "CANCELLED":
        index = -1;
        break;
    }

    // print("index: , status: $status, order_id : $orderid");

    if ((index != -1)) {
      return Container(
        height: 455,
        child: Center(
          child: Column(
            // shrinkWrap: true,
            children: <Widget>[
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                isFirst: true,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: kPrimaryColor,
                  padding: EdgeInsets.all(6),
                ),
                endChild: _RightChild(
                  asset: 'assets/delivery/order_placed.png',
                  title: 'Order Requested',
                  message:
                      'We have received your order request.\nLet\'s see if it\'s available or not. ',
                ),
                beforeLineStyle: const LineStyle(
                  color: kPrimaryLightColor,
                ),
              ),
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                indicatorStyle: IndicatorStyle(
                  // indicator: Icon(Icons.error),
                  width: 20,
                  color: (index >= 1) ? kPrimaryColor : Color(0xFFDADADA),
                  padding: EdgeInsets.all(6),
                ),
                endChild: _RightChild(
                  disabled: (index < 1),
                  asset: 'assets/delivery/order_confirmed.png',
                  title: 'Order Accepted',
                  message:
                      'Yes.. All items are available.\nYour order has been approved.',
                ),
                beforeLineStyle: LineStyle(
                  color: (index >= 1) ? kPrimaryLightColor : Color(0xFFDADADA),
                ),
              ),
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                indicatorStyle: IndicatorStyle(
                  indicator: (index == 1)
                      ? ElevatedButton(
                          onPressed: () {
                            DatabaseService.pay(
                                data!["order_id"], data!["total_amount"]);
                          },
                          child: Text("Pay"))
                      : null,
                  width: (index == 1) ? 55 : 20,
                  color: (index >= 2) ? kPrimaryColor : Color(0xFFDADADA),
                  padding: EdgeInsets.all(6),
                ),
                endChild: _RightChild(
                  ispay: (index == 1),
                  disabled: (index < 2),
                  asset: 'assets/delivery/order_processed.png',
                  title: 'Payment Done',
                  message: 'We are preparing your order.',
                ),
                beforeLineStyle: LineStyle(
                  color: (index >= 2) ? kPrimaryLightColor : Color(0xFFDADADA),
                ),
              ),
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                isLast: true,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: (index >= 3) ? kPrimaryColor : Color(0xFFDADADA),
                  padding: EdgeInsets.all(6),
                ),
                endChild: _RightChild(
                  disabled: (index < 3),
                  asset: 'assets/delivery/ready_to_pickup.png',
                  title: 'Ready to Pickup',
                  message: 'Your order is ready for pickup.',
                ),
                beforeLineStyle: LineStyle(
                  color: (index >= 3) ? kPrimaryLightColor : Color(0xFFDADADA),
                ),
              ),
              (index < 2)
                  ? ElevatedButton(
                      onPressed: () {
                        DatabaseService().cancelOrder(data!["order_id"]);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red, fixedSize: Size(114, 30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cancel),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "cancel",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ))
                  : Container(),
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: Text("Your Order is cancelled"),
      );
    }
  }
}

class _RightChild extends StatelessWidget {
  _RightChild({
    Key? key,
    this.asset,
    this.title,
    this.message,
    this.ispay = false,
    this.disabled = false,
  }) : super(key: key);

  final String? asset;
  final String? title;
  final String? message;
  final bool? disabled;
  final bool? ispay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          // (ispay!)
          //     ? ElevatedButton(
          //         onPressed: () {
          //           // DatabaseService.pay();
          //         },
          //         child: Text("Pay"))
          //     : Container(),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title!,
                style: GoogleFonts.yantramanav(
                  color: disabled!
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message!,
                style: GoogleFonts.yantramanav(
                  color: disabled!
                      ? const Color(0xFFD5D5D5)
                      : const Color(0xFF636564),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
