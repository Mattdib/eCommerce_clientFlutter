import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String? labelText;
  final bool? multiline;
  final bool? enabled;
  final bool isPassword;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onSubmit;
  final VoidCallback? onTap;
  final int? maxLength;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final TextInputType? keyboardType;


  const InputField({this.labelText, this.controller, this.onChanged, this.onSubmit, this.onTap, this.keyboardType, this.multiline, this.maxLength, this.isPassword = false, this.enabled = true, this.textAlign = TextAlign.left}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextField(
        enabled: enabled,
        maxLength: maxLength,
        obscureText: isPassword,
        textAlign: this.textAlign,
        maxLines: multiline != null && multiline == true ? null : 1,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number ? <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ] : null,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        onTap: onTap,
        controller: controller,
        cursorColor: Theme.of(context).colorScheme.primary,
        style: TextStyle(
          height: 1.0,
          color: Theme.of(context).colorScheme.primary,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          fillColor: Theme.of(context).colorScheme.primary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }


}