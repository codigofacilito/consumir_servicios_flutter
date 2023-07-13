import 'package:consumir_serivicios/common/validate.dart';
import 'package:consumir_serivicios/http_protocol/request_error.dart';
import 'package:flutter/material.dart';

class ListFutureError extends StatefulWidget{
  var method;
  var view;
  ListFutureError(this.view,this.method);
  @override
  State<StatefulWidget> createState() =>ListFutureErrorState();

}
class ListFutureErrorState extends State<ListFutureError>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: widget.method(),
        builder: (context, snapshot){

          if(Validate.isNotRequestError(snapshot.data) && snapshot.hasData && snapshot.connectionState==ConnectionState.done){
            return widget.view(snapshot.data);
          }else if(snapshot.data is RequestError){
            RequestError requestError = snapshot.data as RequestError;
            return RefreshIndicator(child: requestError.swipeError!, onRefresh: onRefresh);
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        });
  }

  Future<void> onRefresh()async{

    setState(() {
    });
  }

}