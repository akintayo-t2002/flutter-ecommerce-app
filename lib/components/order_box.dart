import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/order_provider.dart';

class OrderBox extends StatefulWidget {
  OrderBox({super.key,required this.order,});

  final OrderItem order;

  @override
  State<OrderBox> createState() => _OrderBoxState();
}

class _OrderBoxState extends State<OrderBox> {
  bool _isExpanded=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text(DateFormat('dd MMMM yyyy').format(widget.order.dateTime),style:const TextStyle(
                    color:Colors.white,
                    fontSize:18,
                  ),),
                  const SizedBox(height:5,),
                  Text('Total: \$${widget.order.amount}',style:const TextStyle(
                    fontSize:16,
                    color:Colors.green,
                  ),)
                ],
              ),
             GestureDetector(
          onTap:(){
            setState(() {
              _isExpanded=!_isExpanded;
            });
          },
          child:Icon(_isExpanded?Icons.expand_less:Icons.expand_more,color:Colors.white,size:35,)),
            ],
          ),
          if(_isExpanded)Container(
               width:double.infinity,
              height:min(widget.order.products.length*20+20,180),
              padding: const EdgeInsets.all(5),
              child:ListView(
                children:widget.order.products.map((ord) =>Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ord.title,style:const TextStyle(color:Colors.white,fontSize:16),),
                    Text('\$${ord.price.toStringAsFixed(0)}',style:const TextStyle(color:Colors.green),)
                  ],
                )).toList(),
              ),
             ),
        ],
      )
    );
  }
}
