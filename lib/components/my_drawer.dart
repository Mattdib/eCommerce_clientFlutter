import 'package:app_progetto/components/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Implemetazione del menù laterale
class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Text("Explore:",
          style: GoogleFonts.dmSerifDisplay(color: Theme.of(context).colorScheme.inversePrimary,
          fontWeight: FontWeight.bold,
          fontSize: 25)
          ),
          //shop tile:
          new MyListTile(text: "Shop Page", icon: Icons.home,onTap: () => Navigator.pushNamed(context, '/shopPage')),

          //search tile:
          new MyListTile(text: "Search", icon: Icons.search_rounded, onTap: () => Navigator.pushNamed(context, '/searchPage')),

          //advanced Search
          new MyListTile(text: "Advanced Search", icon: Icons.manage_search_rounded, onTap: () => Navigator.pushNamed(context, '/advancedSearch')),

          //cart tile:
          new MyListTile(text: "Cart", icon: Icons.shopping_bag_rounded, onTap: () => Navigator.pushNamed(context, '/cartPage')),

          //exit tile:
          new MyListTile(text: "Exit", icon: Icons.logout, onTap: () => Navigator.pushNamed(context, '/homePage')),

        ]
      ),
    );
  }

}