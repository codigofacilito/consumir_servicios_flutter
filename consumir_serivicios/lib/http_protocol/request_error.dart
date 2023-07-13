import 'package:consumir_serivicios/ui/components/errors/swipe_error.dart';
import 'package:consumir_serivicios/ui/components/errors/text_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../common/enumerations.dart';

class RequestError{
  TypeRequestError typeRequestError;
  Widget? swipeError;
  Widget? textError;
  String messageError;
  Response? response;

  RequestError(this.typeRequestError,{this.response,this.swipeError,this.messageError="",this.textError});

  getRequestError(){
    switch(typeRequestError){
      case TypeRequestError.connectionError:
        return getMessage("Sin conexión");
      case TypeRequestError.serverError:
        return getMessage("Error en el servidor ${response!.statusCode}");
      case TypeRequestError.messageError:
        return getMessage(messageError);
    }
  }
  getMessage(String message){
    messageError = message;
    swipeError =SwipeError(message);
    textError =TextError(message);
    return this;
  }
}