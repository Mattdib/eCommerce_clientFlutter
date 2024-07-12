import 'package:app_progetto/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Product.dart';

class ProductDetailsPage extends StatefulWidget{
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>{
  int quantity=0;

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
                  Button(onTap: addCart(),
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
  }

}//productDetailsPage
