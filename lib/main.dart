import 'package:ecommerceapp/providers/products_provider.dart';
import 'package:ecommerceapp/screens/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create:(ctx)=>ProductsProvider(),
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
      home: const BottomBar(),
    );
  }
}