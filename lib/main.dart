import 'package:ecommerceapp/providers/products_provider.dart';
import 'package:ecommerceapp/screens/bottomBar.dart';
import 'package:ecommerceapp/screens/cart_empty.dart';
import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/favourites_screen.dart';
import 'package:ecommerceapp/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider.value(
    value:ProductsProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily:'Poppins',
        primarySwatch: Colors.blue,
      ),
      routes:{
        '/':(context)=>const BottomBar(),
        '/first':(context) => const ProductsDetailsScreen(),
        '/second':(context) => const CartScreen(),
        '/third':(context)=> const CartEmpty(),
      },
      );
  }
}