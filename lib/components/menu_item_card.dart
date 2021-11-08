import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:canteenapp/models/fooditem_model.dart';

class MenuItem extends StatefulWidget {
  // Map<String, dynamic>? data;
  FoodItem data;
  MenuItem({Key? key, required this.data }) : super(key: key);
  // Map<String, dynamic>? this.data
  @override
  _MenuItemState createState() => _MenuItemState(data);
}

class _MenuItemState extends State<MenuItem> {
  int cnt = 0;
  var data;

  _MenuItemState(data) {
    this.data = data;
  }

  @override
  void initState() {
    cnt = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: Colors.amber,
                    height: 82 * 1.3,
                    width: 72 * 1.3,
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
                        Text("cnt: $cnt"),
                        SizedBox(
                          height: 7,
                        ),
                        Text('${data["item_price"]}',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Color.fromRGBO(126, 126, 126, 1))),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Align(
                            alignment: Alignment(1.0, 0.4),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              color: Color.fromRGBO(232, 76, 79, 1),
                              onPressed: () {
                                setState(() {
                                  cnt += 1;
                                });
                              },
                              child: Text(
                                "+  Add",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            )));
  }
}
