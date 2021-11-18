import 'package:canteenapp/components/misc/plus_minus_btn.dart';
import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:canteenapp/models/fooditem_model.dart';

class MenuItem extends StatelessWidget {
  var data;

  MenuItem({Key? key, Map<String, dynamic>? this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 72 * 1.3,
                    width: 72 * 1.3,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network("${data["imgUrl"]}"))),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: Text("${data["item_name"]}",
                              style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromRGBO(62, 68, 98, 1))),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text('${data["item_price"]} Rs.',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Color.fromRGBO(126, 126, 126, 1))),
                        SizedBox(
                          height: 5,
                        ),
                        PlusMinusBtn(
                          data: data,
                        )
                      ],
                    ))
              ],
            )));
  }
}
