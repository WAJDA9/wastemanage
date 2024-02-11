import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
            elevation: 20,
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            selectedItemColor: Color(0xB73A1892),
            unselectedItemColor: Colors.grey,
            backgroundColor: Color.fromARGB(47, 0, 0, 0),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.payment,
                  ),
                  label: "pay"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  label: "notifications"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_box,
                  ),
                  label: "account"),
            ]),
      ),
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(color: Colors.black, Icons.settings))
          ],
          leading: Image.asset(width: 62, 'assets/images/logo.png')),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Center(
            child: Text("Hey There "),
          )
        ),
      ),
    );
  }
}
