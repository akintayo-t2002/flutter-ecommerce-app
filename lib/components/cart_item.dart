import 'package:ecommerceapp/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.itemName, required this.price,required this.imageUrl, required this.quantity, required this.onTap, required this.id, required this.productId});
  
  final String id;
  final String productId;
 final String imageUrl;
 final String itemName;
 final double price;
 final int quantity;
 final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction:DismissDirection.endToStart,
      onDismissed:((direction) =>Provider.of<CartProvider>(context,listen:false).removeCartItem(productId)),
      key:ValueKey(id),
      background:Container(
        padding:const EdgeInsets.only(right:20),
        margin:const EdgeInsets.symmetric(
          horizontal:15,
          vertical:4, 
        ),
        alignment:Alignment.centerRight,
        color:Colors.red.shade200,
        child:const Icon(Icons.delete,color:Colors.white,),),
      child: Container(
        margin:const EdgeInsets.only(
          right:15
        ),
                  height:85,
                  width:double.infinity,
                  decoration:BoxDecoration(
                    color:const Color(0xFFe7e8f1),
                    borderRadius:BorderRadius.circular(15),
                  ),
                  child:Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:5.0),
                        child: SizedBox(
                          height:70,
                          width:80,
                        child: Image.asset(imageUrl,)),
                      ),
                      Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                         Text(itemName,style:const TextStyle(
                            fontWeight:FontWeight.w700,
                            fontSize:18,
                          ),),
                          Text('$quantity x'),
                          Text('\$${price* quantity}',style:TextStyle(
                         fontWeight:FontWeight.w700,
                         color:Colors.grey.shade700,
                         fontSize:16,
                        ),),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding:const EdgeInsets.only(right:15.0),
                        child: GestureDetector(
                          onTap:onTap,
                          child:const Icon(Icons.delete,color:Colors.red,)),
                      ),
                    ],
                  )),
    );
  }
}