import 'package:ecommerceapp/components/app_drawer.dart';
import 'package:ecommerceapp/components/icon_box.dart';
import 'package:flutter/material.dart';

class OrderEmpty extends StatelessWidget {
  OrderEmpty({super.key});

 final _scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const AppDrawer(),
      key:_scaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        IconBox(child: 
        IconButton(
          onPressed:(){
           _scaffoldKey.currentState!.openDrawer();
         }, 
        icon:const Icon(Icons.menu))),
          const Spacer(),
          Center(
            child: Column(
              children: [
                Image.asset(
              'assets/icons/ticket.png',
              height: 300,
            ),
            const Text(
              'No Orders Yet',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const Text(
              'Buy Something to see your order here',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
