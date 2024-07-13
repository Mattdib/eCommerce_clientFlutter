import 'package:app_progetto/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/Product.dart';
import '../models/cartList.dart';

class ProductDetailsPage extends StatefulWidget{
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>{
  //State parameter:

  int quantity=0; //quantità di prodotto che si vuole acquistare

  //FrontEnd:

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[800],
      ),
      body: Column(
        children: [
          //listview of Product details
          Expanded(
            child: ListView(
              children: [
                //Image:
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                      height: 300,
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image:AssetImage(widget.product.imagePath),
                              fit: BoxFit.cover
                          ),
                          boxShadow: [ BoxShadow(
                              color: Colors.grey.shade600,
                              blurRadius: 10,
                              offset: Offset(0,10)
                          )
                          ]
                      )
                  ),
                ),

                const SizedBox(height: 25),

                //Product name & Descripion title:
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(widget.product.name.toUpperCase(),
                      style: GoogleFonts.dmSerifDisplay(fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800)),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Description: ",
                      style: GoogleFonts.dmSerifDisplay(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800)),
                ),

                const SizedBox(height: 10),

                //Description:
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(widget.product.description,
                      style: GoogleFonts.dmSerifDisplay(fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600)),
                ),
              ]
            )
          ),

          //price+quantity+add to cart
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  //Price number:
                  Row(
                    mainAxisAlignment : MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Price: "+widget.product.price.toString()+"\$",
                          style: GoogleFonts.dmSerifDisplay(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                          )
                      ),
                      Row(
                        children: [
                          //Decrement Button:
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove, color: Colors.white,
                              ),
                              onPressed: decrementQuantity,
                            ),
                          ),

                          //Quantity number:
                          SizedBox(
                            width: 30,
                            child: Center(
                              child: Text(quantity.toString(),
                                  style: GoogleFonts.dmSerifDisplay(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )
                              ),
                            ),
                          ),

                          //Increment Button:
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add, color: Colors.white,
                              ),
                              onPressed: incrementQuantity,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 25),

                  //add to cart Button:
                  Button(onTap: addCart,
                      color: Colors.grey.shade800,
                      child: Text("add to Cart", style: GoogleFonts.dmSerifDisplay(fontSize: 20,
                          fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)
                      )
                  )
                ],
              ),
            ),

          ),
        ],
      ),
    );
  }


  //BackEnd:

  void decrementQuantity(){
    if(quantity > 0){
      setState(() {
        quantity--;
      });
    }
  }

  void incrementQuantity(){
    if(quantity < widget.product.quantity){
      setState(() {
        quantity++;
      });
    }
  }

  addCart(){
    if(quantity > 0){
      final cart = context.read<cartList>();
      cart.addCart(widget.product, quantity);
      print(cart.toString());
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            surfaceTintColor: Theme.of(context).colorScheme.primary,
            content: Text("Add to Cart Successfully!",
              style: GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.bold)
            ),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context); //mi permette di ritornare alla pagina precedente di dettagli del prodotto
              Navigator.pop(context); //....eseguendolo due volte ritorno alla schermata principale (ShopPage oppure SearchPage)
            },
                icon: const Icon(Icons.check_rounded))
          ],
        ),
      );
    }
  }

}//productDetailsPage
