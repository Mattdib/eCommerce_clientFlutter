import 'package:flutter/material.dart';

//Definisco un oggetto ThemeData da un metodo FACTORY del package material di flutter
ThemeData lightMode= ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.grey.shade400,
    secondary: Colors.grey.shade50,
    inversePrimary: Colors.grey.shade700,
  ),
);