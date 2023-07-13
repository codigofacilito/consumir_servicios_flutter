import 'package:consumir_serivicios/models/post_model.dart';
import 'package:consumir_serivicios/ui/components/errors/list_future_error.dart';
import 'package:flutter/cupertino.dart';

import '../cards/post_card.dart';

class PostList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return ListFutureError(view, PostModel().getPosts);
  }

  view(List posts){
    return ListView.builder(
      shrinkWrap: true,
        reverse: true,
        itemCount:posts.length ,
        itemBuilder: (context,index){
          PostModel postModel= posts[index];
          return PostCard(postModel);
        });
  }

}