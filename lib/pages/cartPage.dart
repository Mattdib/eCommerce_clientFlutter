import 'package:app_progetto/models/cartList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../components/my_drawer.dart';
import '../models/Product.dart';

class CartPage extends StatefulWidget{

  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartState();
}

class CartState extends State<CartPage>{

  //FrontEnd:

  @override
  Widget build(BuildContext context) {
    final cart = context.read<cartList>();
    return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                //elevation: 0,
                foregroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text("Cart Page", style: GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.bold))
            ),
            drawer: const MyDrawer(),
            //List of product in the cart:
            body: ListView.builder(
                itemCount: cart.getCart.length,
                itemBuilder: (context, index){
                  final Product product = cart.getCart[index];
                  //Product name:
                  final String  productName = product.name;
                  //Product price:
                  final String price = product.price.toString();
                  //List tile:
                  return Container(
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(productName, style: GoogleFonts.dmSerifDisplay(fontSize: 20),),
                      subtitle: Text(price+"\$"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_rounded),
                        onPressed: removeFromCart,
                      ),
                    ),
                  );
                } // ItemBuilder
            ),
    );
  }

  //BackEnd:
  removeFromCart() {

  }




}//CartState




