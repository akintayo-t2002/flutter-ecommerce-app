import 'package:ecommerceapp/screens/cart_empty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(
        backgroundColor:Colors.white,
        elevation:0,
        centerTitle:false,
        leading:IconButton(
          icon:const Icon(Icons.arrow_back_ios_new,color:Colors.black,),
          onPressed:(){Navigator.pop(context);},
        ),
        title:const Text('My Cart',style:TextStyle(
          fontWeight:FontWeight.w700,
          fontSize:25,
          color:Colors.black,
        ),),
      ),
      body: SafeArea(
        child: Consumer<CartProvider>(builder:(context,value,child)=>value.cartItem.isEmpty?const CartEmpty():Column(
          children: [
            Text(value.cartItem.length.toString(),style:TextStyle(fontSize:20),)
          ],
        )),
      ),
    );
  }
}