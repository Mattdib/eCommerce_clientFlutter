import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import '../support/constants.dart';
import '../support/errorListener.dart';

enum TypeHeader {
  json,
  urlencoded
}

//Componente che gestisce le chiamate ai servizi REST:
class RestManager {
  ErrorListener? delegate;

  Future<String> _makeRequest(String serverAddress, String servicePath, String method, {Map<String, String>? value, dynamic body}) async {
    Uri uri = Uri.http(serverAddress, servicePath, value);
    bool errorOccurred = false;
    while ( true ) {
      try {
        var response;
        // setting content type
        String contentType = "";
        dynamic formattedBody;
        contentType = "application/json;charset=utf-8";
        formattedBody = json.encode(body);
        // setting headers
        Map<String, String> headers = Map();
        headers[HttpHeaders.contentTypeHeader] = contentType;
        // making request
        switch ( method ) {
          case "post":
            response = await post(
              uri,
              headers: headers,
              body: formattedBody,
            );
            break;
          case "get":
            response = await get(
              uri,
              headers: headers,
            );
            break;
          case "put":
            response = await put(
              uri,
              headers: headers,
            );
            break;
          case "delete":
            response = await delete(
              uri,
              headers: headers,
            );
            break;
        }
        if ( delegate != null && errorOccurred ) {
          delegate!.errorNetworkGone();
          errorOccurred = false;
        }
        return response.body;
      } catch(err) {
        if ( delegate != null && !errorOccurred ) {
          delegate!.errorNetworkOccurred(Constants.MESSAGE_CONNECTION_ERROR);
          errorOccurred = true;
        }
        await Future.delayed(const Duration(seconds: 15), () => null); // not the best solution
      }
    }

  }

  Future<String> makePostRequest(String serverAddress, String servicePath, dynamic value) async {
    return _makeRequest(serverAddress, servicePath, "post",  body: value);
  }

  Future<String> makeGetRequest(String serverAddress, String servicePath, [Map<String, String>? value]) async {
    return _makeRequest(serverAddress, servicePath, "get", value: value);
  }

  Future<String> makePutRequest(String serverAddress, String servicePath, [Map<String, String>? value]) async {
    return _makeRequest(serverAddress, servicePath, "put", value: value);
  }

  Future<String> makeDeleteRequest(String serverAddress, String servicePath, [Map<String, String>? value]) async {
    return _makeRequest(serverAddress, servicePath, "delete", value: value);
  }

}