import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyListTile extends StatelessWidget{
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const MyListTile({super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context){
      return ListTile(
          leading: Icon(
              icon,
              color: Theme.of(context).colorScheme.inversePrimary
          ),
          title: Text(text),
          onTap: onTap,
      );
  }

}