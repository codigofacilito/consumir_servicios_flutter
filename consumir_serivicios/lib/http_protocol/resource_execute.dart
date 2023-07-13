import 'package:consumir_serivicios/common/constants/url_constants.dart';
import 'package:consumir_serivicios/http_protocol/http_execute.dart';

class ResourceExecute{
  //Obtener todos los posts
  static getPosts()=>HTTPExecute(postsResource).get();

  //Obtener un post
  static getPost(int postsId)=>HTTPExecute(postsResource+postsId.toString()).get();

  //Obtener los post de un usuario
  static getUserPosts(int userId)=>HTTPExecute(postsResource,queryParameters: {"userId":userId.toString()}).get();

  //Crear un nuevo post
  static createPost(Map<String,dynamic> parameters) =>HTTPExecute(postsResource,parameters: parameters).post();

  //Modificar un post
  static updatePost(int postId,Map<String,dynamic> parameters) =>HTTPExecute(postsResource+postId.toString(),parameters: parameters).put();

  //Eliminar un post
  static deletePost(int postId) =>HTTPExecute(postsResource+postId.toString()).delete();


}