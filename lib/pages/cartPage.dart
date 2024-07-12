import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_drawer.dart';

class CartPage extends StatelessWidget{
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
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


}