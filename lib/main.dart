import 'package:ecommerceapp/providers/cart_provider.dart';
import 'package:ecommerceapp/providers/products_provider.dart';
import 'package:ecommerceapp/screens/bottomBar.dart';
import 'package:ecommerceapp/screens/cart_empty.dart';
import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(ctx)=>ProductsProvider()),
        ChangeNotifierProvider(
          create:(ctx)=>CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily:'Poppins',
          primarySwatch: Colors.blue,
        ),
        routes:{
          '/':(context)=>const BottomBar(),
          '/first':(context) => const ProductsDetailsScreen(),
          // '/second':(context) => const CartScreen(),
          '/third':(context)=> const CartScreen(),
        },
        ),
    );
  }
}