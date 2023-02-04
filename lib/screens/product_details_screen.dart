import 'package:ecommerceapp/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
      final productId=ModalRoute.of(context)!.settings.arguments as String;
      final loadedProducts=Provider.of<ProductsProvider>(context).findbyId(productId);
    return Scaffold(
      backgroundColor:const Color(0xFFe7e8f1),
      body:SafeArea(
        child: Stack(
          children: [
           SizedBox(
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0),
                child: Column(
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children:[
                      IconButton(
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      icon:const Icon(Icons.arrow_back_ios_new)),
                     Container(
                      height:42,
                      width:42,
                      decoration: BoxDecoration(
                        color:Colors.black,
                        borderRadius:BorderRadius.circular(10),
                      ),
                      child:const Icon(Icons.favorite_outline,color:Colors.white,),),
                     ],
                    ),
                    Image.asset(loadedProducts.imageUrl,),
                  ],
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
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:[
                      const SizedBox(height:35,),
                      Text(loadedProducts.title,style:const TextStyle(
                        fontSize:32,
                        color:Colors.white,
                        fontWeight:FontWeight.w700,
                      ),),
                      const SizedBox(height:30,),
                      Text(loadedProducts.description,
                      style:TextStyle(
                        fontSize:18,
                        color:Colors.grey.shade700,
                      ),),
                      const SizedBox(height:50,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children:[
                         Text(loadedProducts.price,style:const TextStyle(
                          color:Colors.white,
                          fontSize:25,fontWeight:FontWeight.w700,
                         ),),
                          Container(
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
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}