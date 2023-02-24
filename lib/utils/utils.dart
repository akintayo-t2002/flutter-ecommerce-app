import 'package:flutter/material.dart';


void showSnackBar(BuildContext context,{required String message, required void Function() onPressed}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,
    content:Text(message),
    action:SnackBarAction(
      label:'UNDO',
      textColor:Colors.white,
      onPressed:onPressed,
    ),
    backgroundColor:Colors.green,
    duration:const Duration(seconds:3),
    padding:const EdgeInsets.all(15),
  ));
}