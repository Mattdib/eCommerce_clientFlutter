import 'package:app_progetto/components/my_drawer.dart';
import 'package:app_progetto/pages/productDetailsPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_productCard.dart';
import '../models/Product.dart';
import '../support/constants.dart';

class ShopPage extends StatefulWidget {

  const ShopPage({super.key});

  ShopState createState() => ShopState();

}

class ShopState extends State<ShopPage>{

  //State parameter:

  bool searching = false;
  //Lista di prova in attesa di sistemare la ricerca dei prodotti tramite API REST:
  List<Product>? products = [
    Product(id: 1,
        name: "product1",
        barcode: "ABDCF1",
        description: "scarpa running corsa rossa molto comoda e ottima per lunghe corse o camminate.",
        quantity: 15,
        price: 20,
        imagePath: "assets/scarpa1.jpg"),
    Product(id: 2,
        name: "product2",
        barcode: "ABDCF2",
        description: "scarpa gialla comoda per uscite all'aperto. Si abbina con ogni tipo di indumento.",
        quantity: 25,
        price: 35,
        imagePath: "assets/scarpa2.jpg"),
    Product(id: 3,
        name: "product3",
        barcode: "ABDCF3",
        description: "scarpa rosa per donna ottima per fare sport o camminte in compagnia di amici.",
        quantity: 27,
        price: 40,
        imagePath: "assets/scarpa3.jpg"),
    Product(id: 4,
        name: "product4",
        barcode: "ABDCF4",
        description: "AirMax scarpa per donna, molto comoda e ottima in qualsiasi contesto.",
        quantity: 20,
        price: 45,
        imagePath: "assets/scarpa4.jpg"),
    Product(id: 5,
        name: "product5",
        barcode: "ABDCF5",
        description: "scarpe sportive uomo colore nero, molto comode per uso sportivo indoor e outdoor.",
        quantity: 18,
        price: 50,
        imagePath: "assets/scarpa5.jpg")

  ];


  //FrontEnd:

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           centerTitle: true,
           backgroundColor: Theme.of(context).colorScheme.secondary,
           foregroundColor: Theme.of(context).colorScheme.inversePrimary,
           title: Text("Shop Page", style: GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.bold))
       ),
      drawer: MyDrawer(),
      body: bottom(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/cartPage'),
          child: Icon(Icons.shopping_bag_rounded, color: Colors.grey.shade800),
      ),
    );
  }

  Widget noResults() {
    return Text("No results Obtained!",
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 15)
    );
  }

  Widget yesResults(){
    return ListView.builder(
      itemCount: products!.length,
      itemBuilder: (context, index){
        return ProductCard(
          product: products![index],
          onTap: () => navigateToProductPage(index),
        );
      },
    );
  }


//BackEnd:
  
  //ricerco la lista dei prodotti da visualizzare nella shopPage (chimata al webServer che mi restituisce una lista di prodotti)
  void search() async {
    final Dio dio = new Dio();
    try {
      setState(() {
        searching = true;
        products = null;
      });
      var result = await dio.get(Constants.REQUEST_SHOP_PAGE);
      //DEBUG
      print(result.statusCode);
      print(result.data);
      var resultData= result.data as List;
      setState(() {
        searching = false;
        products = resultData.map((e) => Product.fromJson(e)).toList();
      });
    }on DioException catch (e){
      print(e);
    }
  }

  Widget bottom() {
    return !searching ?
       products == null ? //Se ha smesso di ricercare e la lista dei prodotti E' NULL.....
       const SizedBox.shrink() : //.....allora crea un box il più piccolo possibile, altrimenti.....
       products!.length == 0 ? //.....SONO CERTO CHE la lista dei prodotti NON E' NULLA (lo indico con "!") e se la sua dimensione è 0 (0 e null NON SONO LA STESSA COSA)
       noResults() : //restituiscimi una stringa che visualizzo a schermo che indica che ciò che è stato ricercato non c'è, altrimenti.....
       yesResults() : //.....restituiscimi la lista dei prodotti che rispettano la ricerca che è stata fatta.
    const CircularProgressIndicator(); //altrimenti mi fa visualizzare l'icona che mi indica che sta ancora attendendo la risposta dal webServer
  }


  void navigateToProductPage(int index){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsPage(product: products![index])));
  }


/*
//ricerco la lista dei prodotti da visualizzare nella shopPage (chimata al webServer che mi restituisce una lista di prodotti)
  void search() {
    setState(() {
      searching = true;
      products = null;
    });
    Model.sharedInstance.searchProductShopPage()?.then((product) {
      setState(() {
        searching = false;
        products = product;
      });
    });
  }
  */

}

/*
//search(); TODO: effettuare chiamate remote alle API REST implementate sul webserver
return Scaffold(
appBar: AppBar(
centerTitle: true,
backgroundColor: Theme.of(context).colorScheme.secondary,
foregroundColor: Theme.of(context).colorScheme.inversePrimary,
title: Text("Shop Page", style: GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.bold))
),
drawer: MyDrawer(),
body: Container(
color: Colors.red,
),
bottomNavigationBar:  Container(
alignment: Alignment.bottomRight,
child: Padding(
padding: const EdgeInsets.all(10),
child: ButtonNavBar(
onTap: () => Navigator.pushNamed(context, '/cartPage'),
),
),
),
);

 */

