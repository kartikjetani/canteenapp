import 'package:canteenapp/utils/constants.dart';
import 'package:canteenapp/utils/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StepperDemo extends StatefulWidget {
  String? status;
  String? orderid;

  StepperDemo({this.status, this.orderid});

  @override
  _StepperDemoState createState() =>
      _StepperDemoState(status: status, orderid: orderid);
}

class _StepperDemoState extends State<StepperDemo> {
  int _index = 0;
  String? status;
  String? orderid;

  _StepperDemoState({this.status, this.orderid});

  @override
  Widget build(BuildContext context) {
    switch (status) {
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

    print("status: ${_index}");

    return Container(
      height: 450,
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
                message: 'We have received your order request.',
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
                color: (_index >= 1) ? kPrimaryColor : Color(0xFFDADADA),
                padding: EdgeInsets.all(6),
              ),
              endChild: _RightChild(
                disabled: true,
                asset: 'assets/delivery/order_confirmed.png',
                title: 'Order Accepted',
                message: 'Your order has been approved.',
              ),
              beforeLineStyle: LineStyle(
                color: (_index >= 1) ? kPrimaryLightColor : Color(0xFFDADADA),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              indicatorStyle: IndicatorStyle(
                // indicator: Icon(Icons.check_circle_outline_outlined),
                width: 20,
                color: (_index >= 2) ? kPrimaryColor : Color(0xFFDADADA),
                padding: EdgeInsets.all(6),
              ),
              endChild: _RightChild(
                ispay: (_index == 1),
                disabled: true,
                asset: 'assets/delivery/order_processed.png',
                title: 'Order Processed',
                message: 'We are preparing your order.',
              ),
              beforeLineStyle: LineStyle(
                color: (_index >= 2) ? kPrimaryLightColor : Color(0xFFDADADA),
              ),
              // afterLineStyle: LineStyle(
              //   color: (_index >= 2) ? kPrimaryLightColor : Color(0xFFDADADA),
              // ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isLast: true,
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: (_index >= 3) ? kPrimaryColor : Color(0xFFDADADA),
                padding: EdgeInsets.all(6),
              ),
              endChild: _RightChild(
                disabled: true,
                asset: 'assets/delivery/ready_to_pickup.png',
                title: 'Ready to Pickup',
                message: 'Your order is ready for pickup.',
              ),
              beforeLineStyle: LineStyle(
                color: (_index >= 3) ? kPrimaryLightColor : Color(0xFFDADADA),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  DatabaseService().cancelOrder(orderid!);
                },
                child: Text("cancel")),
          ],
        ),
      ),
    );
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
          (ispay!)
              ? ElevatedButton(onPressed: () {}, child: Text("Pay"))
              : Container(),
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
