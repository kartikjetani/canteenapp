import 'package:canteenapp/components/menu_item_card.dart';
import 'package:canteenapp/components/misc/stepper.dart';
import 'package:canteenapp/components/primary_btn_red.dart';
import 'package:canteenapp/models/fooditem_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Menu(),
    OrderHistory(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<FoodItem> menu = [];

    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 245, 242, 1),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Menu',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Order',
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red[500],
          onTap: _onItemTapped,
        ),
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(115.0),
        //   child: AppBar(
        //     title: Center(
        //         child: Text("Canteen",
        //             style: GoogleFonts.poppins(
        //                 fontSize: 26,
        //                 fontWeight: FontWeight.w500,
        //                 fontStyle: FontStyle.normal,
        //                 color: Color.fromRGBO(62, 68, 98, 1)
        //                 )
        //                 )
        //                 ),
        //     backgroundColor: Colors.white,
        //     elevation: 0,
        //   ),
        // ),
        body:
            //backgroundColor: Color.fromRGBO(248, 245, 242, 1),
            CustomScrollView(slivers: [
          //Color.fromRGBO(248, 245, 242, 1),
          // PreferredSize(
          //   preferredSize: Size.fromHeight(70.0),
          SliverAppBar(
            backgroundColor: Color.fromRGBO(248, 245, 242, 1),
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: Text(
              'Canteen',
              style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color.fromRGBO(62, 68, 98, 1)),
              //textAlign: TextAlign.center,
            ),
            actions: [
              // backgroundColor: Color.fromRGBO(62, 68, 98, 1),
              IconButton(
                icon: Icon(Icons.notifications),
                color: Color.fromRGBO(232, 76, 79, 1),
                onPressed: () {
                  // ignore: unnecessary_statements
                  Color.fromRGBO(232, 76, 79, 1);
                },
              ),
            ],
            bottom: AppBar(
              backgroundColor: Color.fromRGBO(248, 245, 242, 1),
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.red[10],
                child: Center(
                  child: TextField(
                    //borderSide: BorderSide(color: Colors.teal),
                    onTap: () {
                      // ignore: unnecessary_statements
                    },
                    decoration: InputDecoration(
                      hintText: 'Search for something',
                      prefixIcon: Icon(Icons.search,
                          color: Color.fromRGBO(232, 76, 79, 1)),
                    ),
                  ),
                ),
              ),
              elevation: 0,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 700,
                child: Center(
                  child: _widgetOptions.elementAt(_selectedIndex),
                ),
              ),
              // Container(
              //   height: 1000,
              //   color: Colors.pink,
              // ),
            ]),
          ),
        ])

        // Other Sliver Widgets

        );
    // Center(
    //   child: _widgetOptions.elementAt(_selectedIndex),
    // ),
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Stream<QuerySnapshot> _menuStream =
        FirebaseFirestore.instance.collection('food_items').snapshots();
    return Column(
      children: [
        Container(
          height: size.height * 0.69,
          child: StreamBuilder<QuerySnapshot>(
              stream: _menuStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
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
        PrimaryBtn(
          child: Text("Checkout"),
          onPressed: () {
            Get.to(StepperDemo());
          },
        ),
      ],
    );
  }
}

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        child: Container(
          child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [Text("Date : 23/06/2002")],
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "dhosa x 2",
                                ),
                                Text(
                                  "open tost",
                                ),
                                Text("samosa")
                              ],
                            ),
                            Column(
                              children: [Text("25"), Text("56"), Text("88")],
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [Text("Total : 250")],
                            ),
                          ]),
                    ),
                  ],
                ),
              )),
        ));
  }
}
