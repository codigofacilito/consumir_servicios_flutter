import 'package:consumir_serivicios/http_protocol/request_error.dart';
import 'package:consumir_serivicios/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/validate.dart';

class PostFormScreen extends StatelessWidget {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController bodyCtrl = TextEditingController();
  PostModel postModel;

  PostFormScreen(this.postModel);

  loadData() {
    //agregamos los datos del post a las cajas de texto
      titleCtrl.text = postModel.title;
      bodyCtrl.text = postModel.body;
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Formulario Post")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                TextFormField(
                  controller: titleCtrl,
                  decoration: InputDecoration(
                      hintText: "Titulo", prefixIcon: Icon(Icons.title)),
                ),
                TextFormField(
                  controller: bodyCtrl,
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: "Contenido", prefixIcon: Icon(Icons.title)),
                ),
                TextButton(
                    onPressed: () => save(context), child: Text("Guardar"))
              ],
            ),
          ),
        ));
  }

  getTextEditing() {
    postModel.title = titleCtrl.text;
    postModel.body = bodyCtrl.text;
    print("hhhh ${postModel.title} caja ${titleCtrl.text}");
    //Verificamos que postModel!.id  sea mayor a 0 para asignar el mismo userId sino agregamos
    //uno para el nuevo usuario
    postModel.userId = (postModel.id > 0) ? postModel.userId : 2;
  }

  save(context) async {
    if (keyForm.currentState!.validate()) {
      getTextEditing();
      //Aqui debemos de enviar el postmodel recibido
      var post = await postModel.savePost();
      if (Validate.isNotRequestError(post)) {
        Navigator.pop(context);
        keyForm.currentState!.reset();
      } else {
        RequestError requestError = post as RequestError;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: requestError.textError!));
      }
    }
  }
}
