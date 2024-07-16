import 'package:app_progetto/models/formInfo.dart';
import 'package:app_progetto/pages/productDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/my_productCard.dart';
import '../models/Product.dart';
import '../models/model.dart';


class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  State<ResultPage> createState() => ResultState();
}

class ResultState extends State<ResultPage>{
  bool _searching = false;
  List<Product>? result;

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
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .secondary,
          foregroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text("Result Page",
              style: GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.bold))
      ),
      body: bottom(),
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
    return ListView.builder(
          itemCount: result!.length,
          itemBuilder: (context, index){
            return ProductCard(
              product: result![index],
              onTap: () => navigateToProductPage(index),
            );
          },
        );
  }

  //BackEnd:

  Widget bottom() {
    return  !_searching ?
    result == null ? //Se ha smesso di ricercare e la lista dei prodotti E' NULL.....
    const SizedBox.shrink() : //.....allora crea un box il più piccolo possibile, altrimenti.....
    result!.length == 0 ? //.....SONO CERTO CHE la lista dei prodotti NON E' NULLA (lo indico con "!") e se la sua dimensione è 0 (0 e null NON SONO LA STESSA COSA)
    noResults() : //restituiscimi una stringa che visualizzo a schermo che indica che ciò che è stato ricercato non c'è, altrimenti.....
    yesResults() : //.....restituiscimi la lista dei prodotti che rispettano la ricerca che è stata fatta.
    Center(
      child: Container(
          color: Colors.transparent,
          child: const CircularProgressIndicator() //altrimenti mi fa visualizzare l'icona che mi indica che sta ancora attendendo la risposta dal webServer
      ),
    );

  }

  void search() {
    final form= context.read<FormInfo>();
    Map<String, String>? map = creaMap(form);
    setState(() {
      _searching = true;
      result = null;
    });
    print("Eseguo la ricerca.");
    Model.sharedInstance.advancedSearch(map)?.then((product) {
      setState(() {
        _searching = false;
        result = product;
      });
    });
  }

  navigateToProductPage(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsPage(product: result![index])));
  }

  Map<String, String>? creaMap(FormInfo form) {
    Map<String, String> result = Map();
    if(form.name != null && form.name != ""){
      result["nome"] = form.name!;
    }
    if(form.description != null && form.description != ""){
      result["descrizione"] = form.description!;
    }
    if(form.min != null && form.min != ""){
      result["prezzomin"] = form.min!;
    }
    if(form.max != null && form.max != ""){
      result["prezzomax"] = form.max!;
    }
    print("info trasmesse al Server:");
    print(result.toString());
    return result;
  }

}