import 'package:consumir_serivicios/http_protocol/request_error.dart';

class Validate {
  var data;
  Validate(this.data);


  checkKeyExists(String key,var valueDefault){
    return (data.containsKey(key) && data[key]!=null)?validateType(data[key],valueDefault):valueDefault;
  }

  validateType(var value,var valueDefault){
    switch(valueDefault.runtimeType){
      case int: return int.parse(value.toString());
      case String: return value.toString();
      case double: return double.parse(value.toString());
      case bool: return bool.parse(value.toString());
      default: return value;
    }
  }

  hasRequestErrorOrBody(var method){
    return (data is RequestError)?data:method(data);
  }

  static isNotRequestError(data){
    return (data is! RequestError);
  }
}