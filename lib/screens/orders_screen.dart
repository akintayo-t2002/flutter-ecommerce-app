import 'package:ecommerceapp/components/app_drawer.dart';
import 'package:ecommerceapp/components/icon_box.dart';
import 'package:ecommerceapp/components/order_box.dart';
import 'package:ecommerceapp/providers/order_provider.dart';
import 'package:ecommerceapp/screens/order_empty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

 final _scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final orders=Provider.of<OrderProvider>(context);
    return Scaffold(
      key:_scaffoldKey,
      drawer:const AppDrawer(),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: SafeArea(
          child: orders.orderData.isEmpty? OrderEmpty():Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              IconBox(
                child:IconButton(
                      onPressed:(){
                        _scaffoldKey.currentState!.openDrawer();
                      }, 
                      icon:const Icon(Icons.menu))),
                 const SizedBox(height:20,),
             const Text('My Orders',style:TextStyle(
                fontSize:27,
                fontWeight:FontWeight.bold,
              ),),
              const SizedBox(height:10,),
             Expanded(
              child:ListView.builder(
                itemCount:orders.orderData.length,
                itemBuilder:(ctx,i)=>Padding(
                  padding: const EdgeInsets.only(bottom:10.0),
                  child: OrderBox(
                  order:orders.orderData[i],
                  ),
                )),
             )],
          ),
        ),
      ),
    );
  }
}