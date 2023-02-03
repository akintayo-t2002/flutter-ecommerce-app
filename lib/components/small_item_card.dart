import 'dart:developer';

import 'package:flutter/material.dart';

class SmallItemCard extends StatelessWidget {
  const SmallItemCard({super.key, required this.itemName, required this.imageUrl, required this.itemPrice});

  final String itemName;
  final String imageUrl;
  final String itemPrice;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
     Container(
      padding:const EdgeInsets.symmetric(horizontal:5),
      decoration:BoxDecoration(
        color:const Color(0xFFe7e8f1),
        borderRadius:BorderRadius.circular(10),
      ),
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children:[
            Expanded(child: Image.asset(imageUrl,height:120,)),
            Text(itemName,style:const TextStyle(
              fontSize:17
            ),),
            Text(itemPrice,style:const TextStyle(
              fontSize:20,
              fontWeight:FontWeight.w700,
            ),)
          ],
        ),
      ),
    ),
    Align(
      alignment:Alignment.topRight,
      child:Container(
        height:35,
        width:35,
        decoration: BoxDecoration(
          color:Colors.black,
          borderRadius:BorderRadius.circular(8)
        ),
        child:IconButton(
          icon:Image.asset('assets/icons/heart.png',color:Colors.white),
          onPressed:(){
            log('Button Clicked');
          },
        ),
      ),
    )
      ],
    );
  }
}