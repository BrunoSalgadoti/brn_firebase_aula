import 'dart:ffi';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagensHome extends StatefulWidget {
  ImagensHome({Key? key}) : super(key: key);

  @override
  _ImagensHomeState createState() => _ImagensHomeState();
}

class _ImagensHomeState extends State<ImagensHome> {

  final ImagePicker _picker = ImagePicker();

  var _imagem;

  String _statusUpload = "Carregue uma Imagem";
  String? _urlImagemRecuperada = null;


  Future _recuperarImagem(bool daCamera) async {

    var  imagemSelecionada;

    if ( daCamera ){//carema
      imagemSelecionada = await _picker.pickImage(source: ImageSource.camera);

    }else {
      imagemSelecionada = await _picker.pickImage(source: ImageSource.gallery);

    }
    setState(() {//galeria
      _imagem = imagemSelecionada;
    });
  }

  Future _uploadImagem() async {

    var file = File(_imagem!.path);

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz
        .child('fotos')
        .child('foto.jpg');

    //upload da imagem
    UploadTask task = arquivo.putFile(file);

    //controlar progresso do upload
    task.snapshotEvents.listen((TaskSnapshot storageEvent) {

      if (storageEvent.state == TaskState.running) {
        setState(() {
          _statusUpload = "Em progreso...";

        });
      } else if (storageEvent.state == TaskState.success) {
        _statusUpload = "Upload Realizado com sucesso!";

      }
    });

    //Recuperar url da Imagem
    Future _recuperarUrlImagem (TaskSnapshot snapshot) async {

      String url = await snapshot.ref.getDownloadURL();
      print("Resultado  url  " + url);

      setState(() {
        _urlImagemRecuperada = url;
      });
    }
    ////*
    task.then((TaskSnapshot snapshot){
      _recuperarUrlImagem( snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Selecionar Imagem")
      ),

      body: SingleChildScrollView(

          child: Column(

            children: <Widget>[
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      _recuperarImagem(true);
                      _statusUpload = "Upload não realizado";
                    },
                    child: Text("Camera",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    // Estilização do ElevatedButton
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black12,
                      shadowColor: Colors.black12,
                      elevation: 05,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),)
                ),),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      _recuperarImagem(false);
                      _statusUpload = "Upload não realizado";
                    },
                    child: Text("Galeria",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    // Estilização do ElevatedButton
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black12,
                      shadowColor: Colors.black12,
                      elevation: 05,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),)
                ),),

              _imagem == null
                  ? Container()
                  : Image.file(File(_imagem!.path)),

              _imagem == null
                  ? Container()
                  : Center(
                child: ElevatedButton(
                    onPressed: () {
                      _uploadImagem();
                    },
                    child: Text("Upload Imagem",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    // Estilização do ElevatedButton
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black12,
                      shadowColor: Colors.black12,
                      elevation: 05,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),)
                ),),

              _urlImagemRecuperada == null
                  ? Container()
                  : Image.network(_urlImagemRecuperada!),

              Padding(padding: EdgeInsets.all(15),
                child: Text(_statusUpload),
              ),
            ],)

      ),
    );
  }
}

