import 'package:flutter/material.dart';

class SwipeError extends StatelessWidget{
  String text;
  SwipeError(this.text);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
        child:Center(child:Column(
          children: [
          Text(text,style: TextStyle(fontSize: 26,color: Colors.black)),
          Icon(Icons.refresh,color: Colors.blue,),
          Text("desliza para acrualizar",style: TextStyle(fontSize: 26,color: Colors.black)),
          ],)));
  }

}