import 'package:ecommerceapp/components/order_box.dart';
import 'package:ecommerceapp/providers/order_provider.dart';
import 'package:ecommerceapp/screens/order_empty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders=Provider.of<OrderProvider>(context);
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: SafeArea(
          child: orders.orderData.isEmpty?const OrderEmpty():Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
             const Text('My Orders',style:TextStyle(
                fontSize:27,
                fontWeight:FontWeight.bold,
              ),),
              const SizedBox(height:20,),
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