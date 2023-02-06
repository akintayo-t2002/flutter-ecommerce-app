import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment:CrossAxisAlignment.start,
             children: [
              const SizedBox(height:20,),
              const Text('My Cart',style:TextStyle(
                 fontWeight:FontWeight.w700,
                 fontSize:25,
                 color:Colors.black,
                 ),),
                 const SizedBox(height:10,),
               Container(
                height:85,
                width:double.infinity,
                decoration:BoxDecoration(
                  color:const Color(0xFFe7e8f1),
                  borderRadius:BorderRadius.circular(15),
                ),
                child:Row(
                  children: [
                    Image.asset('assets/images/airpod3.png'),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: const [
                        Text('Airpod 3',style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontSize:18,
                        ),),
                        Text('Headphones'),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right:15.0),
                      child: Text('\$150',style:TextStyle(
                       fontWeight:FontWeight.w700,
                       color:Colors.grey.shade700,
                       fontSize:18,
                      ),),
                    ),
                  ],
                ),
               ),
             ],
           );
  }
}