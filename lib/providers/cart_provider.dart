import 'package:flutter/material.dart';

class Cart{
  final String id;
  final String title;
  final int quantity;
  final double price;

  Cart({required this.id, required this.title, required this.quantity, required this.price});
}

class CartProvider with ChangeNotifier{

  final Map<String,Cart>_item={};

  Map<String,Cart> get cartItem=>_item;

  //getter which returns the total cart item length
  int get cartCount=>_item.length;

 // function to add a cart item
  void addItem(String productId, String title, double price){
    if(_item.containsKey(productId)){
      //Here if the product already exists in the cart, we need to increase the quantity of the product
     _item.update(productId, (value) =>Cart(
      id:value.id,
      title:value.title,
      price:value.price,
      quantity:value.quantity+1,
     ));
    }else{
      //if the product doesn't exist, add a new cart item
      _item.putIfAbsent(productId, () =>Cart(
        id:DateTime.now().toString(),
        title:title,
        price:price,
        quantity:1,
      ));
    }
    notifyListeners();
  }
  
  //getter to obtain the total amount of items in the cart
  double get totalAmount{
    double total=0.00;
    _item.forEach((key,cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }
}