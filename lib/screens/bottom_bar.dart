import 'package:ecommerceapp/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'favourites_screen.dart';
import 'home_screen.dart';
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
   OrdersScreen(),
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
      // drawer:const AppDrawer(),
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
          BottomNavigationBarItem(icon: Image.asset('assets/icons/payment.png'),label:'Orders'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/profile.png'),label:'Profile'),
        ],
      ),
      body:screens[selectedIndex],
    );
  }
}