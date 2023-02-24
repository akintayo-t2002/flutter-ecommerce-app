import 'dart:developer';

import 'package:ecommerceapp/components/cart_item.dart';
import 'package:ecommerceapp/providers/order_provider.dart';
import 'package:ecommerceapp/screens/cart_empty.dart';
import 'package:ecommerceapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
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
          child: cart.cartItem.isEmpty?const CartEmpty(): Column(
            children:[
             Expanded(
               child: ListView.builder(
                itemCount:cart.cartCount,
                shrinkWrap:true,
                itemBuilder:(ctx,i)=>Padding(
                  padding:const EdgeInsets.only(bottom:15),
                  child:CartItem(
                    onDelete:(){
                     cart.cartItem.values.toList()[i].quantity<=1?log('Less than 1'):Provider.of<CartProvider>(context,listen:false).updateItemQuantity(cart.cartItem.keys.toList()[i],WhichSelected.delete);
                    },
                    onAdd:(){
                       Provider.of<CartProvider>(context,listen:false).updateItemQuantity(cart.cartItem.keys.toList()[i],WhichSelected.add);
                    },
                  id:cart.cartItem.values.toList()[i].id,
                  productId:cart.cartItem.keys.toList()[i],
                  imageUrl:cart.cartItem.values.toList()[i].itemImage,
                  itemName:cart.cartItem.values.toList()[i].title,
                  price:cart.cartItem.values.toList()[i].price,
                  quantity:cart.cartItem.values.toList()[i].quantity,
                  onTap:(){
                    cart.removeCartItem(cart.cartItem.keys.toList()[i]);},
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
                          children:[
                            Padding(
                              padding:const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap:(){
                               Provider.of<OrderProvider>(context,listen:false).addOrder(cart.cartItem.values.toList(),cart.totalAmount);
                               showSnackBar(context, message:'Order Placed Successfully', onPressed:(){});
                               cart.clear();
                                },
                                child:const Text('Order Now',style:TextStyle(color:Colors.white,fontSize:15))),
                            ),
                            const Icon(Icons.arrow_forward_ios,color:Colors.white,),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}