import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final void Function()? onTap;
  final Widget child;
  final Color color;

  const Button({super.key, required this.onTap, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
      return GestureDetector( //restituisco un widget che intercetta una gesture(in questo caso di click, ossia "onTap")
        onTap: onTap, //quando il widget viene cliccato viene eseguita la function che specifico all'invocazione del costruttore
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12) 
          ),
          padding: const EdgeInsets.all(25),
          child: child
        )
      );
  }

}//Button