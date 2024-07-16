import 'package:app_progetto/components/my_drawer.dart';
import 'package:app_progetto/pages/productDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_productCard.dart';
import '../models/Product.dart';
import '../models/model.dart';

class ShopPage extends StatefulWidget {

  const ShopPage({super.key});

  ShopState createState() => ShopState();

}

class ShopState extends State<ShopPage>{

  //State parameter:

  bool _searching = false;
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    search();
  }


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
    return Center(
      child: Text("No results Obtained!",
          style: GoogleFonts.dmSerifDisplay(color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 30, fontWeight: FontWeight.bold)
      ),
    );
  }

  Widget yesResults(){
      return  ListView.builder(
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
  void search() {
    setState(() {
      _searching = true;
      products = null;
    });
    Model.sharedInstance.searchProductShopPage()?.then((product) {
      setState(() {
        _searching = false;
        products = product;
      });
    });
  }


  Widget bottom() {
    //print("invocato il metodo search: ");
    //search();
    return  !_searching ?
    products == null ? //Se ha smesso di ricercare e la lista dei prodotti E' NULL.....
    const SizedBox.shrink() : //.....allora crea un box il più piccolo possibile, altrimenti.....
    products!.length == 0 ? //.....SONO CERTO CHE la lista dei prodotti NON E' NULLA (lo indico con "!") e se la sua dimensione è 0 (0 e null NON SONO LA STESSA COSA)
    noResults() : //restituiscimi una stringa che visualizzo a schermo che indica che ciò che è stato ricercato non c'è, altrimenti.....
    yesResults() : //.....restituiscimi la lista dei prodotti che rispettano la ricerca che è stata fatta.
    Center(
      child: Container(
          color: Colors.transparent,
          child: const CircularProgressIndicator() //altrimenti mi fa visualizzare l'icona che mi indica che sta ancora attendendo la risposta dal webServer
      ),
    );
  }


  void navigateToProductPage(int index){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsPage(product: products![index])));
  }

} //ShopPage
