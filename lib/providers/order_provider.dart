import 'package:ecommerceapp/providers/cart_provider.dart';
import 'package:flutter/material.dart';

import '../components/cart_item.dart';

class OrderItem with ChangeNotifier{
  final String id;
  final double amount;
  final DateTime dateTime;
  final List<Cart> products;

  OrderItem({required this.dateTime, required this.id,required this.amount,required this.products});
}

   class OrderProvider with ChangeNotifier{
    final List<OrderItem> _orders=[];
   
   List<OrderItem> get orderData=>_orders;

   void addOrder(List<Cart>cartProducts, double total){
  if(cartProducts.isEmpty){
    return;
  }else{
    _orders.insert(0, OrderItem(
      id:DateTime.now().toString(), 
      amount: total, 
      dateTime:DateTime.now(),
      products:cartProducts)
      );
       notifyListeners();
   }}
   }