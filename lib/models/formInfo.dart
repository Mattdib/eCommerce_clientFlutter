import 'package:flutter/material.dart';

class FormInfo extends ChangeNotifier{
  String? name;
  String? description;
  String? min;
  String? max;
  String? type;

  void setName(String nome){
    this.name=nome;
    notifyListeners();
  }

  void setDescription(String descrizione){
    this.description=descrizione;
    notifyListeners();
  }

  void setmin(String min){
    this.min=min;
    notifyListeners();
  }

  void setmax(String max){
    this.max=max;
    notifyListeners();
  }

  void setType(String type){
    this.type=type;
    notifyListeners();
  }

}