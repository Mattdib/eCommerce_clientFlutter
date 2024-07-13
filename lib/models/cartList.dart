import 'package:flutter/material.dart';

import 'Product.dart';

class cartList extends ChangeNotifier{

  List<Product> _cartList = [];

  //add to cart:
  void addCart(Product product, int quantity){
    for(int i=0; i<quantity; i++){
      _cartList.add(product);
    }
    notifyListeners();
  }

  //remove from cart:
  void removeCart(Product product){
    _cartList.remove(product);
    notifyListeners();
  }

  //TEST aggiunta prodotti nella _cartList: (WORK!)
  @override
  String toString() {
    print("Products in Cart: ");
    List<String> productName = [];
    for(int i=0; i<_cartList.length; i++){
      var name = _cartList[i].name;
      productName.add(name);
    }
    return productName.toString();
  }

}