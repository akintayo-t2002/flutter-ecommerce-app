import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favouritesscreen extends StatelessWidget {
  const Favouritesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> favourite=Provider.of<ProductsProvider>(context).products.where((prod)=> prod.isFavourite==true).toList();
    return Scaffold(
       body:ListView.builder(
          itemCount:favourite.length,
          itemBuilder:(ctx,i)=>
        Container(
          child:Text(favourite[i].title),
        )),
      );
  }
}