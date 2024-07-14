import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/cartList.dart';
import '../support/constants.dart';

class PurchasePage extends StatefulWidget{
   PurchasePage({super.key});

   State<PurchasePage> createState() => PurchaseState();
}

class PurchaseState extends State<PurchasePage>{
  bool verifing = false;
  String result="";

  //FrontEnd:

  @override
  Widget build(BuildContext context) {
    search();
    return Scaffold(
        body: bottom(),
    );
  }

  Widget noResults() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" Error with the Purchase:",
                style: GoogleFonts.dmSerifDisplay(color: Colors.red.shade800,
                    fontSize: 30, fontWeight: FontWeight.bold)
            ),

            SizedBox(height: 10),
            //Error Text from the webServer:
            Text(result,
                style: GoogleFonts.dmSerifDisplay(color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 30, fontWeight: FontWeight.bold)
            ),

            SizedBox(height: 20),

            FloatingActionButton.extended(
              onPressed: () => Navigator.pushNamed(context, '/cartPage'),
                backgroundColor: Colors.grey.shade800,
              label: Text("Go to Cart Page",
                  style: GoogleFonts.dmSerifDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.primary)
              )
            )
          ],
        ),
      );
  }


  yesResults(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Purchase completed!", //result
              style: GoogleFonts.dmSerifDisplay(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)
          ),

          SizedBox(height: 20),

          FloatingActionButton.extended(
              onPressed: () => Navigator.pushNamed(context, '/shopPage'),
              backgroundColor: Colors.grey.shade800,
              label: Text("Go to Shop Page",
                  style: GoogleFonts.dmSerifDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.primary)
              )
          )
        ],
      ),
    );
  }


  //BackEnd:

  Widget bottom() {
    return  !verifing?
        result == "Purchase added with success!"?
        yesResults() :
        noResults() :
    Center(
      child: Container(
          color: Colors.transparent,
          child: const CircularProgressIndicator() //altrimenti mi fa visualizzare l'icona che mi indica che sta ancora attendendo la risposta dal webServer
      ),
    );
  }

  void search() async {
    final cart = context.read<cartList>();
    var json = jsonEncode(cart.getCart);
    print("JSON trasmesso:");
    print(json);
    final Dio dio = new Dio();
    try {
      setState(() {
        verifing = true;
      });
      result = (await dio.post(Constants.REQUEST_ADD_PURCHASE, queryParameters: {'idUtente' : 1} , data: json )) as String;
      setState(() {
        verifing = false;
      });
    }on DioException catch (e){
      print(e);
    }
  }

}