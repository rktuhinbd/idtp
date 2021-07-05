import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:idtp/src/service/network_exception.dart';

class ApiRequest {
  static const _baseUrl = 'http://103.43.55.23:31001/';

  static Future<dynamic> get(url) async {
    Map<String, String> headers = {};

    print("getting headers :> $headers");
    print(url);
    headers = {'Content-Type': 'application/json'};
    print("Headers Done :> $headers");
    try {
      var uri = Uri.parse(_baseUrl + url);
      print(uri);

      http.Request request = http.Request("GET", uri);
      request.headers.addAll(headers);

      final response = await request.send();

      return _response(response);
    } catch(e){
      print("Exception: $e");
    }
  }

  static Future<dynamic> post(url, body) async {
    Map<String, String> headers = {};

    print("getting headers :> $headers");
    print(url);
    headers = {'Content-Type': 'application/json'};
    print("Headers Done :> $headers");
    try {
      var uri = Uri.parse(_baseUrl + url);
      print(uri);

      http.Request request = http.Request("POST", uri);
      request.body = body;
      request.headers.addAll(headers);

      final response = await request.send();

      return _response(response);
    } catch(e){
      print("Exception: $e");
    }

  }

  static dynamic _response(var res) async {

    http.Response response = await http.Response.fromStream(res);
    print("REs-COde-> ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded REsponse >" + responseJson);

        return responseJson;

      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded REsponse >" + responseJson);

        return responseJson;

      case 202:
        var responseJson = utf8.decode(response.bodyBytes).toString();
        print(responseJson);

        return "OK";

      case 204:
        var responseJson = utf8.decode(response.bodyBytes).toString();
        print(responseJson);

        return "OK";
      case 400:
        // myAlertDialog("Bad Request", context);
        return "error ${response.body.toString()}";
        throw BadRequestException(
            response.body.toString() + response.statusCode.toString());
      case 401:
        print("${response.body.toString()}");
        throw UnauthorisedException(response.body.toString() + "S-401");
      case 403:
        throw UnauthorisedException(response.body.toString() + "S-403");

      case 405:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded Response >" + responseJson);

        return responseJson;

      case 500:
        print("Error-Code:500+${response.body.toString()}");
        throw UnauthorisedException(response.body.toString() + "S-500");

      case 497:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded Response >" + responseJson);

        return responseJson;
      case 498:
      case 499:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded Response >" + responseJson);

        return "OTP";
      case 979:
        var responseJson = utf8.decode(response.bodyBytes).toString();
        print(responseJson);

        String status = responseJson.replaceAll('"', "");
        print("Message : $status");

        // myAlertDialog(status, context);
        return status;
      default:
        var responseJson = utf8.decode(response.bodyBytes);
        print("Decoded Response =>" + responseJson);

        return responseJson;
    }
  }
}
