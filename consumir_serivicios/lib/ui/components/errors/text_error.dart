import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextError extends StatelessWidget{
  String text;
  TextError(this.text);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text,style: TextStyle(fontSize: 26,color: Colors.white),);
  }

}