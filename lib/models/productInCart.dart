import 'package:flutter/material.dart';

class ProductInCart {
  final int id;
  final String name;
  final int quantity;
  final double price;

  const ProductInCart({required this.id, required this.quantity, required this.name, required this.price});

  Map<String, dynamic> toJson() => {
    'prodotto' : { 'id': id },
    'quantitaAcquistata': quantity,
  };

}