import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:consumir_serivicios/common/constants/url_constants.dart';
import 'package:consumir_serivicios/http_protocol/request_error.dart';
import 'package:http/http.dart';

import '../common/enumerations.dart';
import 'package:http/http.dart' as http;
class HTTPExecute{
  String resource;
  Map<String, dynamic>parameters;
  Map<String, dynamic>queryParameters;
  HTTPExecute(this.resource,{this.parameters = const {},this.queryParameters=const {}});

  get(){
    return checkConnection(HTTPMethod.get);
  }
  post(){
    return checkConnection(HTTPMethod.post);
  }

  put(){
    return checkConnection(HTTPMethod.put);
  }
  delete(){
    return checkConnection(HTTPMethod.delete);
  }

  checkConnection(HTTPMethod httpMethod)async{
   final connection = await Connectivity().checkConnectivity();
   if(connection == ConnectivityResult.none){
     return RequestError(TypeRequestError.connectionError).getRequestError();
   }else{
     return await executeMethod(httpMethod);
   }
  }

  executeMethod(HTTPMethod httpMethod)async{
    Response response;
    switch(httpMethod){
      case HTTPMethod.get:
        print("endpPoint $endPoint");
        response = await http.get(endPoint,headers: headers);
        break;
      case HTTPMethod.post:
        response = await http.post(endPoint,body: encodedParameters,headers: headers);
        break;
      case HTTPMethod.put:
        response = await http.put(endPoint,body:encodedParameters ,headers: headers);
        break;
      case HTTPMethod.delete:
        response = await http.delete(endPoint,body: encodedParameters,headers: headers);
        break;
    }

   return validateResponse(response);
  }

  Map<String,String>get headers => {
    'Content-type': 'application/json; charset=UTF-8',
  };

  String get encodedParameters => json.encode(parameters);

  get endPoint => (queryParameters.isNotEmpty)?Uri.https(domain,path+resource,queryParameters):Uri.parse(uri+resource);

  validateResponse(Response response){
    print("Respuesta Body ${response.body.toString()}");
    return (response.statusCode >=200 && response.statusCode<300)?
        json.decode(response.body.toString()):RequestError(TypeRequestError.serverError,response: response).getRequestError();
  }
}