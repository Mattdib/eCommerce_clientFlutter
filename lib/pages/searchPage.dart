import 'package:app_progetto/components/my_circularButton.dart';
import 'package:app_progetto/pages/productDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_drawer.dart';
import '../components/my_inputField.dart';
import '../components/my_productCard.dart';
import '../models/model.dart';
import '../models/Product.dart';

class SearchPage extends StatefulWidget {
  SearchPage() : super();

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  bool _searching = false;
  List<Product>? _products; //lista prodotti restituita da una richiesta al webServer

  final TextEditingController _searchFiledController = TextEditingController(); //Controller per l'accesso all'area di testo


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          //elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Search Page", style: GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.bold))
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [
            top(), //widget che implementa la parte superiore della finestra di ricerca
            bottom(), //widget che implementa la parte inferiore della finestra di ricerca
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cartPage'),
        child: Icon(Icons.shopping_bag_rounded, color: Colors.grey.shade800),
      ),

    );
  }

  Widget top() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row( //creo una riga di widget
        children: [
          Flexible(
            child: InputField(  //creo un campo di testo
              labelText: "Name of the product:",
              controller: _searchFiledController,
              onSubmit: (value) {
               search();
              },
            ),
          ),
          CircularButton(
            child: Icon(Icons.search_rounded),
            onTap: () {
             search();
            },
          ),
        ],
      ),
    );
  }


  Widget bottom() {
    return  !_searching ?
             _products == null ? //Se ha smesso di ricercare e la lista dei prodotti E' NULL.....
                  const SizedBox.shrink() : //.....allora crea un box il più piccolo possibile, altrimenti.....
                  _products!.length == 0 ? //.....SONO CERTO CHE la lista dei prodotti NON E' NULLA (lo indico con "!") e se la sua dimensione è 0 (0 e null NON SONO LA STESSA COSA)
                  noResults() : //restituiscimi una stringa che visualizzo a schermo che indica che ciò che è stato ricercato non c'è, altrimenti.....
                  yesResults() : //.....restituiscimi la lista dei prodotti che rispettano la ricerca che è stata fatta.
    Center(
      child: Container(
          color: Colors.transparent,
          child: const CircularProgressIndicator() //altrimenti mi fa visualizzare l'icona che mi indica che sta ancora attendendo la risposta dal webServer
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

  Widget yesResults() {
    return Expanded(
    child:  Container(
      child: ListView.builder(
        itemCount: _products!.length,
        itemBuilder: (context, index){
          return ProductCard(
            product: _products![index],
            onTap: () => navigateToProductPage(index),
          );
        },
      ),
    ),
    );
  }

  //ricerco la lista dei prodotti da visualizzare nella shopPage (chimata al webServer che mi restituisce una lista di prodotti)
  void search() {
    setState(() {
      _searching = true; //imposto che sono in stato di ricerca
      _products = null;  //lista dei prodotti ancora null
    });
    //Invoco il metodo searchProduct che invierà al webServer una richiesta di ottenere tutti i prodotti col nome
    //indicato all'interno del "form" di ricerca (chiamata asincrona). Quando il metodo riceverà la risposta
    //da parte del webserver (lista di prodotti), tramite il metodo .then(nomeOggettoOttenutoDalMetodo)
    //non faccio altro che dire "dopo l'esecuzione del metodo esegui queste operazioni":
    Model.sharedInstance.searchProduct(_searchFiledController.text)?.then((product) {
      setState(() { //riaggirno lo stato della pagina impostando _searching a false (poichè è terminata) e assegnado a _products la lista di prodotti ottenuti dal metodo
        _searching = false;
        _products = product;
      });
    });
  }

  void navigateToProductPage(int index){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsPage(product: _products![index])));
  }

}