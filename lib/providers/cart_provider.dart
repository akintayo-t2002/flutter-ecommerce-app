import 'package:flutter/material.dart';

class Cart{
  final String itemImage;
  final String id;
  final String title;
  int quantity;
  final double price;

  Cart({required this.itemImage,required this.id, required this.title, required this.quantity, required this.price});
}

enum WhichSelected{
  add,delete;
}

class CartProvider with ChangeNotifier{

  Map<String,Cart>_item={};
                                                                                                                                                                                                                                                                                                                                                                                                                    
  Map<String,Cart> get cartItem=>_item;

  //getter which returns the total cart item length
  int get cartCount=>_item.length;

 // function to add a cart item
  void addItem(String productId, String title, double price,String imageUrl){
    if(_item.containsKey(productId)){
      //Here if the product already exists in the cart, we need to increase the quantity of the product
     _item.update(productId, (value) =>Cart(
      itemImage:value.itemImage,
      id:value.id,
      title:value.title,
      price:value.price,
      quantity:value.quantity+1,
     ));
    }else{
      //if the product doesn't exist, add a new cart item
      _item.putIfAbsent(productId, () =>Cart(
        itemImage:imageUrl,
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

// function to remove a single item, the function is used in the undo function of a snackbar
  void removeSingleitem(String productId){
  //here if the item doesn't exist in lets say a cart, then the function should not be called
    if(!_item.containsKey(productId)){
      return;
    }

    // if the item exist, then reduce the quantity by 1
    if(_item[productId]!.quantity>1){
      _item.update(productId, (existingCartItem) =>Cart(
      itemImage:existingCartItem.itemImage, 
      id: existingCartItem.id, 
      title: existingCartItem.title, 
      quantity: existingCartItem.quantity-1, 
      price: existingCartItem.price),);
    }else{
      _item.remove(productId);
    }
    notifyListeners();
  }

// code to delete item from cart
  void removeCartItem(String productId){
    _item.remove(productId);
    notifyListeners();
    }


    void updateItemQuantity(String productId, WhichSelected picked){
     switch(picked){
      case WhichSelected.add: {
        _item[productId]!.quantity++;
      }
      break;
      case WhichSelected.delete:{
         _item[productId]!.quantity--;
      }
     }
     notifyListeners();
    }

//code to clear all cart items
   void clear(){
    _item={};
    notifyListeners();
   }
}