import 'package:canteenapp/models/fooditem_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrderCheckoutController extends GetxController{
      List<FoodItem> listOfOrder = <FoodItem>[].obs;

      void onInit() {
            super.onInit();
      }

      void checkout(List<FoodItem> foodList) {
            listOfOrder = foodList.where((element) => element.quantity != 0).toList();
            print(listOfOrder);
      }
}