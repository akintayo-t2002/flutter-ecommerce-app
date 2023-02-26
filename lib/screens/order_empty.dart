import 'package:flutter/material.dart';

class OrderEmpty extends StatelessWidget {
  const OrderEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Column(
          children: [
            const Spacer(),
            Image.asset('assets/icons/ticket.png',height:300,),
            const Text('No Orders Yet',style:TextStyle(
              fontSize:22,
            ),),
            const Text('Buy Something to see your order here',style:TextStyle(
              fontSize:16,
              color:Colors.grey
            ),),
           const  Spacer(),
          ],
        ),
      ),
    );
  }
}