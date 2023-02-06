import 'package:ecommerceapp/components/favourites_item.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/providers/products_provider.dart';
import 'package:ecommerceapp/screens/favourites_empty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favouritesscreen extends StatelessWidget {
  const Favouritesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> favourite=Provider.of<ProductsProvider>(context).products.where((prod)=> prod.isFavourite==true).toList();
    return Scaffold(
       body:
       favourite.isEmpty?const FavouritesEmpty():
       SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal:15.0),
           child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
             children: [
              const Text('My Favorites',style:TextStyle(
            fontWeight:FontWeight.w700,
            fontSize:25,
            color:Colors.black,
        ),),
        const SizedBox(height:12,),
               Expanded(
                 child: ListView.builder(
                    itemCount:favourite.length,
                    itemBuilder:(ctx,i)=>
                    Column(
                      children: [
                        const SizedBox(height:20,),
                        GestureDetector(
                          onTap:(){
                            Navigator.of(context).pushNamed('/first',arguments:favourite[i].id);
                          },
                          child: FavouritesItem(
                           productName:favourite[i].title,
                           productCategory:favourite[i].category,
                           imageUrl:favourite[i].imageUrl,
                          ),
                        ),
                      ],
                    )
                   ),
               ),
             ],
           ),
         ),
       ),
      );
  }
}