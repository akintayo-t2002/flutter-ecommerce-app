import 'package:flutter/material.dart';
import 'favourites_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class BottomBar extends StatefulWidget {
   const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> screens=[
   const HomeScreen(),
   const Favouritesscreen(),
   const NotificationScreen(),
   const ProfileScreen(),
  ];

  int selectedIndex=0;

  void navigateBottomBar(int index){
  setState(() {
    selectedIndex=index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        currentIndex:selectedIndex,
        onTap:navigateBottomBar,
        showSelectedLabels:false,
        showUnselectedLabels:false,
        selectedItemColor:Colors.black,
        unselectedItemColor:Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/icons/home.png'),label:'Home'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/heart.png'),label:'Favourites'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/notification1.png'),label:'Notification'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/profile.png'),label:'Profile'),
        ],
      ),
      body:screens[selectedIndex],
    );
  }
}