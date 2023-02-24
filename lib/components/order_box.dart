import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/order_provider.dart';

class OrderBox extends StatelessWidget {
  const OrderBox({super.key,required this.order,});

  final OrderItem order;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Image.asset(
            'assets/images/airpod3.png',
            height: 75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const[
                Text(
                'Airpod 3',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              Text(
                '3 items',
               style: TextStyle(color:Colors.white, fontSize: 16),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children:[
              Text('\$${order.amount}',style:const TextStyle(
                color:Colors.green,
                fontSize:18,
              ),),
              Text(DateFormat('d MMMM y').format(order.dateTime),style:TextStyle(
                color:Colors.grey.shade600,
                fontSize:14,
              ),),
            ],
          )
        ],
      ),
    );
  }
}
