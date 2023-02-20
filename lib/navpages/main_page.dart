import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vacation_tour_app/navpages/nav_item_page.dart';
import 'package:vacation_tour_app/navpages/profile_page.dart';
import 'package:vacation_tour_app/navpages/search_page.dart';

import '../pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    NavItemPage(),
    SearchPage(),
    MyProfilePage()
  ];

  int currentIndex = 0;
  void onNavigationTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: onNavigationTap,
        selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items:[
            BottomNavigationBarItem(
                icon: Icon(Icons.apps),
            label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: "Bar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile"),
          ] ),

    );
  }
}
