import 'package:app_progetto/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key}); //si specifica la proprietà const quando si tratta di oggetti che dopo esser stat inizializzati non cambiano stato.

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface, //ottengo l'informazione sul TEMA ATTUALMENTE IN USO dai "widget vicini" e mi prendo il colore del backgrond
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon
              Icon(Icons.shopping_bag_rounded, size: 120),

              const SizedBox(height: 25), //uso questo widget per creare uno spazio tra i due widget

              //NameApp
              Text("Shopping App",
              style: GoogleFonts.dmSerifDisplay(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                ),
              ),

              const SizedBox(height: 10),

              //Subtitle
              Text("Great products with low price!",
              style: GoogleFonts.dmSerifDisplay(color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 15)
              ),

              const SizedBox(height: 25),
              
              //Button
              Button(onTap: () => Navigator.pushNamed(context, '/shopPage'),
                  color: Theme.of(context).colorScheme.primary,
                  child: Text("Enter",style: GoogleFonts.dmSerifDisplay(fontSize: 20, fontWeight: FontWeight.bold),)
              )
            ],
          )
            )
    );

  }

}