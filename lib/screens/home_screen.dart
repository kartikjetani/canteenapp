import 'package:canteenapp/components/menu_item_card.dart';
import 'package:canteenapp/components/primary_btn_red.dart';
import 'package:canteenapp/models/fooditem_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<FoodItem> menu = [];
    final Stream<QuerySnapshot> _menuStream =
        FirebaseFirestore.instance.collection('food_items').snapshots();

    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 245, 242, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            title: Center(
                child: Text("Today's Menu",
                    style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color.fromRGBO(62, 68, 98, 1)))),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        body: Column(
          children: [
            Container(
              height: size.height * 0.7,
              child: StreamBuilder<QuerySnapshot>(
                  stream: _menuStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;

                        int cnt = 0;
                        return (data["is_avail"])
                            ? MenuItem(
                                data: data,
                              )
                            : Container();
                      }).toList(),
                    );
                  }),
            ),
            PrimaryBtn(child: Text("Checkout")),
          ],
        ));
  }
}
