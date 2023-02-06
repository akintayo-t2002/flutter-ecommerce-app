import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(
        backgroundColor:Colors.white,
        elevation:0,
        centerTitle:false,
        title:const Text('My Cart',style:TextStyle(
          fontWeight:FontWeight.w700,
          fontSize:25,
          color:Colors.black,
        ),),
      ),
      body:Center(
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            const SizedBox(height:200,),
            Image.asset('assets/icons/empty-cart.png',color:Colors.grey.shade500,),
            const SizedBox(height:20,),
             Text('Oops, your shopping cart is empty! \n     Add items you want to by.',style:TextStyle(
              fontSize:20,
              color:Colors.grey.shade500,
            ),),
            const Spacer()
          ],
        ),
      ),
    );
  }
}