import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlusMinusBtn extends StatefulWidget {
  Map<String, dynamic>? data;

  PlusMinusBtn({Key? key, this.data}) : super(key: key);

  @override
  _PlusMinusBtnState createState() => _PlusMinusBtnState(data);
}

class _PlusMinusBtnState extends State<PlusMinusBtn> {
  int cnt = 0;
  var data;

  _PlusMinusBtnState(data) {
    this.cnt = data['quantity'];
    this.data = data;
  }

  @override
  void initState() {
    print("${data['item_name']} cnt as of now is : ${data['quantity']}");
    cnt = data['quantity'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        alignment: Alignment.bottomRight,
        child: (cnt == 0)
            ? RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                color: Color.fromRGBO(232, 76, 79, 1),
                onPressed: () {
                  setState(() {
                    cnt += 1;
                  });
                  data["quantity"] = cnt;
                  print(
                      "${data['item_name']} cnt as of now is : ${data['quantity']}");
                  // print("cnt of ${data['item_name']}: $cnt" );
                  data["quantity"] = cnt;
                  // cartController.add(data);
                  cartController.increament(data);
                },
                child: Text(
                  "+  Add",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            : Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        cnt -= 1;
                        data["quantity"] = cnt;
                        print(
                            "${data['item_name']} cnt as of now is : ${data['quantity']}");
                        data["quantity"] = cnt;
                        cartController.increament(data);
                      });
                    },
                    child: Icon(Icons.remove),
                    fillColor: Color(0xffE1E1E1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    color: Color(0xffF8F5F2),
                    width: 30,
                    height: 30,
                    child: Text("${data?['quantity']}")),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        cnt += 1;
                        data["quantity"] = cnt;
                        print(
                            "${data['item_name']} cnt as of now is : ${data['quantity']}");
                        // print("cnt of ${data['item_name']}: $cnt" );
                        data["quantity"] = cnt;
                        cartController.increament(data);
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    fillColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ]));
  }
}
