import 'package:ecommerceapp/components/cart_item.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:18.0),
          child: Consumer<CartProvider>(builder:(context,cart,value)=>Column(
            children:[
             Expanded(
               child: ListView.builder(
                itemCount:cart.cartCount,
                itemBuilder:(ctx,i)=>Padding(
                  padding:const EdgeInsets.only(bottom:10),
                  child: CartItem(
                  imageUrl:'assets/images/iphone14.png',
                  itemName:cart.cartItem.values.toList()[i].title,
                  price:cart.cartItem.values.toList()[i].price.toString(),
                  itemCategory:'Category',
                  ),
                ),
               ),
             ),
              Container(
                padding:const EdgeInsets.all(30),
                decoration:BoxDecoration(
                  color:Colors.black,
                  borderRadius:BorderRadius.circular(20),
                ),
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children:[
                      const Text('Total Price',style:TextStyle(
                        color:Colors.white,
                        fontSize:18),),
                      Text('\$${cart.totalAmount.toStringAsFixed(2)}',style:const TextStyle(
                        color:Colors.white,
                        fontSize:16,fontWeight:FontWeight.w700)),
                      ],
                      ),
                    Container(
                        decoration:BoxDecoration(
                          border:Border.all(color:Colors.grey.shade700),
                          borderRadius:BorderRadius.circular(20),
                        ),
                        child:Row(
                          children:const [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Pay Now',style:TextStyle(color:Colors.white,fontSize:15)),
                            ),
                            Icon(Icons.arrow_forward_ios,color:Colors.white,),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),)
        )
      ),
    );
  }
}