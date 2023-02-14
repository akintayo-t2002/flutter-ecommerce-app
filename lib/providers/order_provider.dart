import 'package:flutter/material.dart';

import '../components/cart_item.dart';

class OrderItem with ChangeNotifier{
  final String id;
  final double amount;
  final DateTime dateTime;
  final List<CartItem> products;

  OrderItem({required this.dateTime, required this.id,required this.amount,required this.products});
  
  final List<OrderItem> _orders=[];
   
   List get orders=>_orders;

   void addOrder(List<CartItem>cartProducts, double total){
    _orders.insert(0, OrderItem(
      id:DateTime.now().toString(), 
      amount: total, 
      dateTime:DateTime.now(),
      products:cartProducts)
      );
       notifyListeners();
   }
}