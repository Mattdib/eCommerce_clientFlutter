import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget{
  final void Function()? onTap;
  final Widget child;

  const CircularButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( //restituisco un widget che intercetta una gesture(in questo caso di click, ossia "onTap")
        onTap: onTap, //quando il widget viene cliccato viene eseguita la function che specifico all'invocazione del costruttore
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(35)
            ),
            padding: const EdgeInsets.all(15),
            child: child
        )
    );
  }

}//Button