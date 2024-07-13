import 'dart:collection';

import 'package:flutter/material.dart';

import 'Product.dart';

class cartList extends ChangeNotifier{

  final LinkedHashMap _cartList =  LinkedHashMap<Product, int>(); //Non Lavora sugli indici ma sulle CHIAVI!

  //Getter:
  LinkedHashMap get getCart => _cartList;

  //add to cart:
  void addCart(Product product, int quantity){
    _cartList[product]=quantity;
    notifyListeners();
  }

  //remove from cart:
  void removeCart(Product product){
    _cartList.remove(product);
    notifyListeners();
  }

  @override
  String toString() {
    LinkedHashMap list= LinkedHashMap<String, int>();
    _cartList.forEach((Product , int){
      list[Product.name]=int;
    });
    return list.toString();
  }

}

