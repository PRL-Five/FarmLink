// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:farmlink/components/cus_bottom_nav_bar.dart';
import 'package:farmlink/screens/cus_cart_page.dart';
import 'package:farmlink/screens/cus_fav_page.dart';
import 'package:farmlink/screens/cus_shop_page.dart';
import 'package:farmlink/screens/profile_page.dart';
import 'package:farmlink/screens/signInConsumer.dart';
import 'package:farmlink/screens/signin.dart';
import 'package:flutter/material.dart';
typedef dict = Map<String,dynamic>;
class homeConsumer extends StatefulWidget {
  final String fullName,password,mobile,email;

  const homeConsumer({super.key, required this.fullName, required this.password, required this.mobile, required this.email});

  @override
  State<homeConsumer> createState() => _homeConsumerState();
}

class _homeConsumerState extends State<homeConsumer> {
  // this index is to control the bottom nav bar
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Pages to display
  final List<Widget> _pages = [
    const CusShopPage(),
    const CusFavPage(),
    const CusFavPage(), // this will be search page not created yet
    const CusCartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    String fullName = widget.fullName;
    String password = widget.password;
    String mobile = widget.mobile;
    String email = widget.email;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          //title: const Text("Home Page"),
          backgroundColor: Colors.green[50],
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: const Icon(
                  Icons.menu,
                  // color: Colors.green,   // colors of menu icon
                ),
              ),
            ),
          ),
        ),

        backgroundColor: Colors.green[50],
        // backgroundColor: Colors.white,
        body: Center(
          child: _pages[_selectedIndex],
          // child: Text('Selected tab: $_selectedIndex'),
        ),

        //bottomNavigationBar: CusBottomNavBar(onTabChange: _onTabChange),
        bottomNavigationBar: CusBottomNavBar(
          onTabChange: (index) => _onTabChange(index),
        ),

        // Drawer edit
        drawer: Drawer(
          backgroundColor: Colors.green.shade50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // logo
                  DrawerHeader(
                    child: Image.asset('lib/assets/app-icon-removebg.jpg'),
                  ),
                  // Other Pages
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(
                        ("P R O F I L E"),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(fullName: fullName,password: password,email: email,mobile: mobile,),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(
                        ("S E T T I N G S"),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(fullName: fullName,password: password,email: email,mobile: mobile,),
                          )),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.contact_page_rounded),
                      title: Text(
                        ("C H A T"),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(fullName: fullName,password: password,email: email,mobile: mobile,),
                          )),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text(
                        ("A B O U T"),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(fullName: fullName,password: password,email: email,mobile: mobile,),
                          )),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 25),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    ("L O G O U T"),
                  ),
                  onTap: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                          (Route<dynamic> route) => false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
