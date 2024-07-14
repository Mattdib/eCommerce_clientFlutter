import 'dart:collection';

import 'package:app_progetto/models/productInCart.dart';
import 'package:flutter/material.dart';

import 'Product.dart';

class cartList extends ChangeNotifier{

  List<ProductInCart> _cartList= [];

  //Getter:
  List<ProductInCart> get getCart => _cartList;

  //add to cart:
  void addCart(Product product, int quantity){
      _cartList.add(ProductInCart(id: product.id, quantity: quantity, name: product.name, price: product.price));
      notifyListeners(); //Notifico tutti gli ascoltatori che lo stato della lista è cambiato.
  }

  //remove from cart:
  void removeCart(ProductInCart product){
    _cartList.remove(product);
    notifyListeners();
  }

  @override
  String stampaLista() {
    List<String> list= [];
    for(int i=0; i<_cartList.length; i++){
      String name= _cartList[i].name;
      String quantity= _cartList[i].quantity.toString();
      list.add("{ "+name+" : "+quantity+" }");
    }
    return list.toString();
  }

}

