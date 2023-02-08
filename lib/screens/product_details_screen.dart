import 'package:ecommerceapp/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/badge.dart';
import '../providers/cart_provider.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
      final productId=ModalRoute.of(context)!.settings.arguments as String;
      final loadedProducts=Provider.of<ProductsProvider>(context).findbyId(productId);
      final cart=Provider.of<CartProvider>(context);
    return ClipRRect(
      child: Hero(
        tag:loadedProducts.id,
        child: Scaffold(
          backgroundColor:const Color(0xFFe7e8f1),
          body:SafeArea(
            child: Stack(
              children: [
               SizedBox(
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                    child: SizedBox(  
                      child: Column(
                        children:[
                          SizedBox(
                            width:double.infinity,
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children:[
                              GestureDetector(
                               onTap:(){ Navigator.pop(context);},
                               child: const Icon(Icons.arrow_back_ios_new)),
                          Consumer<CartProvider>(
                    builder:(context,value,ch)=>GestureDetector(
                      onTap:(){
                        Navigator.pushNamed(context,'/third');
                      },
                      child: Badge(
                      color:Colors.red,
                      value:value.cartCount.toString(),
                      child:ch!,
                    ),
                    ),
                  child: Container(
                      height:42,
                      width:42,
                      decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(12),
                        border:Border.all(color:Colors.grey.shade300,width:2),
                      ),
                      child:Image.asset('assets/icons/shopping-bag.png',height:5,),
                    ),
                  )
                             ], 
                            ),
                          ),
                          Image.asset(loadedProducts.imageUrl,),
                        ],
                      ),
                    ),
                  )
                ), 
                Align(
                  alignment:Alignment.bottomCenter,
                  child: Container(
                    height:height*0.35,
                    width:double.infinity,
                    decoration:const BoxDecoration(
                      color:Colors.black,
                      borderRadius:BorderRadius.only(
                        topLeft:Radius.circular(55),
                        topRight:Radius.circular(55))
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal:30.0),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children:[
                            const SizedBox(height:25,),
                            Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(loadedProducts.title,style:const TextStyle(
                                    fontSize:32,
                                    color:Colors.white,
                                    fontWeight:FontWeight.w700,
                                  ),),
                                ),
                                GestureDetector(
                              onTap:(){
                                Provider.of<ProductsProvider>(context,listen:false).toggleFavourites(productId);
                              },
                               child: Container(
                                height:42,
                                width:42,
                                decoration: BoxDecoration(
                                  color:Colors.grey.shade900,
                                  borderRadius:BorderRadius.circular(10),
                                ),
                                child:Icon(loadedProducts.isFavourite?Icons.favorite:Icons.favorite_outline,
                                color:loadedProducts.isFavourite?Colors.red:Colors.white,),),
                             ),
                              ],
                            ),
                            const SizedBox(height:10,),
                            Expanded(
                              child: Text(loadedProducts.description,
                              style:TextStyle(
                                fontSize:17,
                                color:Colors.grey.shade700,
                              ),),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom:15.0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children:[
                                 Expanded(
                                   child: Text('\$${loadedProducts.price}',style:const TextStyle(
                                    color:Colors.white,
                                    fontSize:25,fontWeight:FontWeight.w700,
                                   ),),
                                 ),
                                  GestureDetector(
                                    onTap:(){
                                   cart.addItem(loadedProducts.id,loadedProducts.title,loadedProducts.price);
                                    },
                                    child: Container(
                                      padding:const EdgeInsets.symmetric(horizontal:20,vertical:15),
                                      decoration: BoxDecoration(
                                        color:const Color(0xFFe7e8f1),
                                        borderRadius:BorderRadius.circular(25),
                                      ),
                                      child:Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children:[
                                         const Text('Add to cart',style:TextStyle(
                                           fontSize:16,
                                           fontWeight:FontWeight.w700,
                                         ),),
                                          const SizedBox(width:10,),
                                          Image.asset('assets/icons/shopping-bag.png',height:18,),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}