import 'package:canteenapp/components/menu_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ListDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DataOfMenu> menu = [];
    menu.add(DataOfMenu("menu_item_1", "Fruit salad mix", 18.500));
    menu.add(DataOfMenu("menu_item_1", "Fruit salad mix choco Milk", 20.500));

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
        body: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image(
                              height: 82 * 1.3,
                              width: 72 * 1.3,
                              image: AssetImage(
                                  'assets/images/${menu[index].imgUrl}.png')),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.50,
                                  child: Text("${menu[index].Name}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color:
                                          Color.fromRGBO(62, 68, 98, 1))),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text('${menu[index].price}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color:
                                        Color.fromRGBO(126, 126, 126, 1))),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.5,
                                  child: Align(
                                    alignment: Alignment(1.0, 0.4),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      color: Color.fromRGBO(232, 76, 79, 1) ,
                                      onPressed: () {
                                        //Todo: implement main logic here for adding item to cart!!!
                                      },
                                      child: Text("+  Add", style: TextStyle(color: Colors.white, fontSize: 18),),
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    )

                ),
              );
            }) //ListView.builder()
    );
  }
}
