import 'package:canteenapp/components/misc/stepper.dart';
import 'package:canteenapp/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    // userController.temp();

    return Column(
      children: [
        Container(
          height: 120,
          child: Obx(
            () => ListView.builder(
              itemCount: userController.activeOrderList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                        "${userController.activeOrderList.value[index].toString()}"));
              },
            ),
          ),
        ),
        Container(height: 500, child: StepperDemo())
      ],
    );
  }
}
