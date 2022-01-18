// ignore: avoid_web_libraries_in_flutter

import 'package:canteenapp/components/menu_item_card.dart';
import 'package:canteenapp/components/misc/checkout_btn.dart';
import 'package:canteenapp/controllers/cart_controller.dart';
import 'package:canteenapp/models/fooditem_model.dart';
import 'package:canteenapp/screens/order_screen.dart';
import 'package:canteenapp/utils/auth.dart';
import 'package:canteenapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Behavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _counter = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Menu(),
    // OrderHistory(),
    OrderScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CartController cartController = Get.find();
    List<FoodItem> menu = [];

    return Obx(() => Scaffold(
        endDrawer: Drawer(
            child: Material(
          color: Color.fromRGBO(248, 245, 242, 1),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: [
              // UserAccountsDrawerHeader(

              //     accountName: Text("M D"),
              //     accountEmail: Text("email@gmail.com")),
              SizedBox(height: 50),
              ListTile(
                hoverColor: Colors.red[600],
                leading: Icon(Icons.security),
                title: Text(
                  "Security",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(62, 68, 98, 1)),
                ),
                onTap: () => {},
              ),
              SizedBox(height: 20),
              ListTile(
                hoverColor: Colors.red[600],
                leading: Icon(Icons.search),
                title: Text(
                  "Search",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(62, 68, 98, 1)),
                ),
                onTap: () => {},
              ),
              SizedBox(height: 20),
              ListTile(
                hoverColor: Colors.red[600],
                leading: Icon(Icons.update),
                title: Text(
                  "Updates",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(62, 68, 98, 1)),
                ),
                onTap: () => {},
              ),
              SizedBox(height: 20),
              ListTile(
                hoverColor: Colors.red[600],
                leading: Icon(Icons.favorite),
                title: Text(
                  "Favourite",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(62, 68, 98, 1)),
                ),
                onTap: () => {},
              ),
              SizedBox(height: 40),
              Divider(
                thickness: 1,
                color: Colors.red[600],
              )
            ],
          ),
        )),
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
        body: Builder(
          builder: (context) =>
              CustomScrollView(scrollBehavior: Behavior(), slivers: [
            SliverAppBar(
              backgroundColor: Color.fromRGBO(248, 245, 242, 1),
              floating: true,
              pinned: true,
              snap: false,
              centerTitle: false,
              title: Text(
                'Hello, ${Authentication.currentUser.displayName ?? "User"}',
                style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Color.fromRGBO(62, 68, 98, 1)),
                //textAlign: TextAlign.center,
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Color.fromRGBO(232, 76, 79, 1),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();

                    // ignore: unnecessary_statements

                    Color.fromRGBO(232, 76, 79, 1);
                  },
                ),
                // backgroundColor: Color.fromRGBO(62, 68, 98, 1),
                IconButton(
                  icon: Icon(Icons.notifications),
                  color: Color.fromRGBO(232, 76, 79, 1),
                  onPressed: () {
                    // ignore: unnecessary_statements

                    setState(() {
                      _counter++;
                    });
                    flutterLocalNotificationsPlugin.show(
                        0,
                        "Testing $_counter",
                        "How you doin ?",
                        NotificationDetails(
                            android: AndroidNotificationDetails(
                                'high_importance_channel', // id
                                'High Importance Notifications',
                                importance: Importance.high,
                                color: Colors.blue,
                                playSound: true,
                                icon: '@mipmap/ic_launcher')));

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
              Container(child: _widgetOptions.elementAt(_selectedIndex)),

              // ElevatedButton(
              //     child: Text("Logout"),
              //     onPressed: () {
              //       Authentication.signOut();
              //     })
            ])),
          ]),
        ),
        floatingActionButton:
            (_selectedIndex == 0 && cartController.totalQty.value != 0)
                ? FloatingActionButton.extended(
                    onPressed: () {},
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    label: Container(
                      width: size.width * 0.85,
                      child: CheckoutBtn(
                        cartController: cartController,
                      ),
                    ),
                  )
                : null
        // Other Sliver Widgets
        ));
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CartController cartController = Get.find();

    List<Widget> menuItemBuilder() {
      var array = <Widget>[];
      for (var item in cartController.menuItems.value) {
        if (item.isAvail == true) {
          print("item: ${item.toString()}");
          array.add(MenuItem(data: item.toJson()));
        }
      }
      return array;
    }

    return Obx(
      () => Column(children: menuItemBuilder()),
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
