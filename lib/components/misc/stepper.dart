import 'package:canteenapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: true,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: kPrimaryColor,
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              asset: 'assets/delivery/order_placed.png',
              title: 'Order Placed',
              message: 'We have received your order.',
            ),
            beforeLineStyle: const LineStyle(
              color: kPrimaryLightColor,
            ),
          ),
          TimelineTile(
            isLast: true,
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: const IndicatorStyle(
              indicator: Icon(Icons.error),
              width: 20,
              color: Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              disabled: true,
              asset: 'assets/delivery/order_confirmed.png',
              title: 'Order Confirmed',
              message: 'Your order has been confirmed.',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: const IndicatorStyle(
              // indicator: Icon(Icons.check_circle_outline_outlined),
              width: 20,
              color: Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              disabled: true,
              asset: 'assets/delivery/order_processed.png',
              title: 'Order Processed',
              message: 'We are preparing your order.',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
            afterLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isLast: true,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              disabled: true,
              asset: 'assets/delivery/ready_to_pickup.png',
              title: 'Ready to Pickup',
              message: 'Your order is ready for pickup.',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
        ],
      ),
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    Key? key,
    this.asset,
    this.title,
    this.message,
    this.disabled = false,
  }) : super(key: key);

  final String? asset;
  final String? title;
  final String? message;
  final bool? disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          // Opacity(
          //   // child: Image.asset(asset!, height: 50),
          //   child: Icon(Icons.check_circle),
          //   opacity: disabled! ? 0.5 : 1,
          // ),
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
