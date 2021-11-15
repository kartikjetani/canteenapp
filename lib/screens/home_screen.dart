import 'package:canteenapp/components/menu_item_card.dart';
import 'package:canteenapp/components/misc/checkout_btn.dart';
import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/models/fooditem_model.dart';
import 'package:canteenapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    final cartController = Get.put(CartController());

    List<FoodItem> menu = [];

    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 245, 242, 1),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Menu',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Order',
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryColor,
          onTap: _onItemTapped,
        ),
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(70.0),
        //   child: AppBar(
        //     title: Center(
        //         child: Text("Canteen",
        //             style: GoogleFonts.poppins(
        //                 fontSize: 26,
        //                 fontWeight: FontWeight.w500,
        //                 fontStyle: FontStyle.normal,
        //                 color: Color.fromRGBO(62, 68, 98, 1)))),
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
                height: size.height,
                child: _widgetOptions.elementAt(_selectedIndex)),
            CheckoutBtn(cartController: cartController)
          ])),
        ])

        // Other Sliver Widgets
        );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CartController cartController = Get.find();

    return Column(
      children: [
        Expanded(
          // height: size.height * 0.7,
          child: Obx(
            () => ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartController.cartItems.value.length,
              itemBuilder: (context, index) {
                return cartController.cartItems[index].isAvail == true
                    ? MenuItem(data: cartController.cartItems[index].toJson())
                    : Container();
              },
            ),
          ),
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
