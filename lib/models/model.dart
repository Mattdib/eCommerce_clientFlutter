import 'dart:convert';
import '../support/constants.dart';
import 'Product.dart';
import 'restManager.dart';


//classe che implementa il design pattern SINGLETON (La classe crea e gestisce "da se" l'unica sua istanza (nome dell'istanza "sharedInstance")
class Model {
  static Model sharedInstance = Model();

  RestManager restManager= RestManager();

  //chiamata ad un servizio REST asincrona: (che riceve in input ciò che abbiamo scritto all'interno della pagina riga di ricerca della nosta search_page)
  Future<List<Product>?>? searchProduct(String name) async { //il metodo resistiusce IN FUTURO (ossia all'arrivo della risposta da parte del webServer) un oggetto List<Prodotto>
    Map<String, String> params = Map();
    params["name"] = name;
    try {
      List<Product> result = List<Product>.from(json.decode(await restManager.makeGetRequest( Constants.ADDRESS_STORE_SERVER,
          Constants.REQUEST_SEARCH_PRODUCTS, params)).map((i) => Product.fromJson(i)).toList());
      print("Lista prodotti restituita dal webServer:");
      print(result.toString());
      return result;
    }
    catch (e) {
      return null; 
    }
  }

  Future<List<Product>?>? advancedSearch([Map<String, String>? value]) async { //il metodo resistiusce IN FUTURO (ossia all'arrivo della risposta da parte del webServer) un oggetto List<Prodotto>
    try {
      List<Product> result = List<Product>.from(json.decode(await restManager.makeGetRequest( Constants.ADDRESS_STORE_SERVER,
          Constants.REQUEST_ADVANCED_SEARCH, value)).map((i) => Product.fromJson(i)).toList());
      print("Lista prodotti restituita dal webServer:");
      print(result.toString());
      return result;
    }
    catch (e) {
      return null; 
    }
  }

  Future<String?>? addPurchase([Map<String, String>? value, dynamic body]) async { //il metodo resistiusce IN FUTURO (ossia all'arrivo della risposta da parte del webServer) un oggetto List<Prodotto>
    try {
      String result = (json.decode(await restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ADD_PURCHASE, value, body)) as String);
      print(result);
      return result;
    }
    catch (e) {
      return null;
    }
  }

  Future<List<Product>?>? searchProductShopPage() async {
    //il metodo resistiusce IN FUTURO (ossia all'arrivo della risposta da parte del webServer) un oggetto List<Prodotto>
    Map<String, String> params = Map();
    params["numeroPagina"] = "0";
    params["dimPagina"] = "5";
    params["ordinaPer"] = "id";
    try {
      List<Product> result = List<Product>.from(json.decode(await restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER,
              Constants.REQUEST_SHOP_PAGE, params)).map((i) => Product.fromJson(i)).toList());
      print("Lista prodotti restituita dal webServer:");
      print(result.toString());
      return result;
    }
    catch (e) {
      return null; 
    }
  }

}