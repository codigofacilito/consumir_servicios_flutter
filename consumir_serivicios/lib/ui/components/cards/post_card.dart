import 'package:consumir_serivicios/ui/screen/post_form_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/post_model.dart';

class PostCard extends StatelessWidget{
  PostModel postModel;
  PostCard(this.postModel);
  //Agrege el clic para abrir la ventada y poder editar el post
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return InkWell(
       onTap: (){
         //Se abre la ventana y se comparte el post a editar
         Navigator.push(context, MaterialPageRoute(builder:
             (context)=>PostFormScreen(postModel,)));
       },
       child:Card(
     child: ListTile(
       title: Text(postModel.title,style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
       subtitle:Text(postModel.body,style: const TextStyle(fontSize: 21) ,
     ),
   )));
  }

}