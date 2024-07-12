import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Product.dart';
import '../pages/productDetailsPage.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  void Function()? onTap;

  ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 500,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image:AssetImage(product!.imagePath),
              fit: BoxFit.cover
            ),
            boxShadow: [ BoxShadow(
              color: Colors.grey.shade600,
              blurRadius: 10,
              offset: Offset(0,10)
             )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                      //Product name:
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product!.name.toString().toUpperCase(),
                            style: GoogleFonts.dmSerifDisplay(fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500)
                          )
                        ],
                      )
                  )
                ],
              ),
              //Product price:
              Text("Price: "+product!.price.toString().toUpperCase()+"\$",
                  style: GoogleFonts.dmSerifDisplay(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500)
              )
            ],
          ),
        )
      ),
    );
  } // buid

}