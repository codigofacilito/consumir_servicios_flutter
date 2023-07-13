import 'package:consumir_serivicios/common/validate.dart';
import 'package:consumir_serivicios/http_protocol/resource_execute.dart';

class PostModel{
  int id;
  String title;
  String body;
  int userId;
  PostModel({this.id=0,this.title="",this.body="",this.userId=0});


  @override
  String toString() {
    return id.toString();
  }

  toObject(Map<dynamic,dynamic>data){
    Validate validate = Validate(data);
    return PostModel(
      id: validate.checkKeyExists("id",0 ),
      title: validate.checkKeyExists("title",""),
      body: validate.checkKeyExists("body",""),
      userId:validate.checkKeyExists("userId",0)
    );
  }

  toMap(){
    return {
      "id" : (id>0)?id.toString():"",
      "title":title,
      "body":body,
      "userId":userId.toString()
    };
  }

  getPosts()async{
    var response = await ResourceExecute.getPosts();
    return Validate(response).hasRequestErrorOrBody(getListObject);
  }

  getPost()async{
    var response = await ResourceExecute.getPost(id);
    return Validate(response).hasRequestErrorOrBody(toObject);
  }

  getUserPosts()async{
    var response = await ResourceExecute.getUserPosts(userId);
    return Validate(response).hasRequestErrorOrBody(getListObject);
  }

  savePost()async{
    var response =(id>0)?await ResourceExecute.updatePost(id, toMap()): await ResourceExecute.createPost(toMap());
    return Validate(response).hasRequestErrorOrBody(toObject);
  }

  deletePost()async{
    var response = await ResourceExecute.deletePost(id);
    return Validate(response).hasRequestErrorOrBody(toObject);
  }

  getListObject(data){
    return (data as List).map((map) => toObject(map)).toList();
  }

}