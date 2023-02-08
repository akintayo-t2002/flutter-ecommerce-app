import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.itemName, required this.price, required this.itemCategory, required this.imageUrl});
  
 final String imageUrl;
 final String itemName;
 final String price;
 final String itemCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
                height:85,
                width:double.infinity,
                decoration:BoxDecoration(
                  color:const Color(0xFFe7e8f1),
                  borderRadius:BorderRadius.circular(15),
                ),
                child:Row(
                  children: [
                    Image.asset(imageUrl),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                       Text(itemName,style:const TextStyle(
                          fontWeight:FontWeight.w700,
                          fontSize:18,
                        ),),
                        Text(itemCategory),
                        Text(price,style:TextStyle(
                       fontWeight:FontWeight.w700,
                       color:Colors.grey.shade700,
                       fontSize:16,
                      ),),
                      ],
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right:15.0),
                      child: Icon(Icons.delete,color:Colors.red,),
                    ),
                  ],
                ));
  }
}