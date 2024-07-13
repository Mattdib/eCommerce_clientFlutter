import 'package:app_progetto/models/cartList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../models/Product.dart';
import '../models/cartList.dart';

class CartPage extends StatefulWidget{

  const CartPage({super.key});

  State<CartPage> createState() => CartState();
}

class CartState extends State<CartPage>{

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cartList>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          //elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Cart Page", style: GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.bold))
      ),
      drawer: MyDrawer(),
    );

  }


}//CartState




