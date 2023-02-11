import 'package:flutter/material.dart';

void showSnackBar(String message, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content:Text(message),
    backgroundColor:Colors.green,
    duration:const Duration(seconds:2),
    padding:const EdgeInsets.all(25),
  ));
}