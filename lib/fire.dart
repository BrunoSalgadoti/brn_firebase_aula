import 'package:cloud_firestore/cloud_firestore.dart';

Future<dynamic> fire() async {

  //inserir dados no firebase
  await FirebaseFirestore.instance
      .collection("usuarios")
      .doc("pontuacao")
      .set({"Bruno": "150", "Rosy": "100", "Franklin" : "250"});
}

//inserir dados no firebase com uma variável DB
Future<dynamic> fire2 () async {

  FirebaseFirestore db = await FirebaseFirestore.instance;

  await db.collection("usuario")
      .doc("001")
      .set(
      {
        "nome": "Bruno de Pádua",
        "idade": "40",
        "sexo": "masculino"
      }
  );
}

//Adicionando no banco de dados com ID automática
Future<dynamic> fire3 () async {

  FirebaseFirestore db = await FirebaseFirestore.instance;

  DocumentReference? ref = await db.collection("Notícias")
      .add(
      {
        "Título": "Future<Dynamic>",
        "Descrição": "Este é o segredo de concatenar \n várias funções em uma variável...",
      }
  );
  //retornando o id que foi registrado
  print("Item Salvo:" + ref.id);
}

//Atualizando no banco de dados com ID automática
Future<dynamic> fire4 () async {

  FirebaseFirestore db = await FirebaseFirestore.instance;

  await db.collection("Notícias")
      .doc("NTNe5GWZdQuzwHU0vj3c")
      .set(
      {
        "Título": "Future<Dynamic> ATUALIZADO",
        "Descrição": "Funcionando corretamente...",
      }
  );
}

//Deletando do banco de dados
Future<dynamic> fire5 () async {

  FirebaseFirestore db = await FirebaseFirestore.instance;

  await db.collection("usuarios")
      .doc("003").delete();
}

//Recuperar um dado expecífico do banco de dados Firebase
Future<dynamic> fire6 () async {

  FirebaseFirestore db = await FirebaseFirestore.instance;

  DocumentSnapshot snapshot = await db.collection("usuario")
      .doc("001") // recupera com o ID do campo
      .get();

  dynamic dados = snapshot.data();
  print("Dados: Nome: " + dados["Nome"] + " idade: " + dados["idade"] );

  //print("Dados: " + snapshot.data().toString());

}

//Recuperar todos os dados de um determinado banco de dados Firebase (menos os que mudarem)
Future<dynamic> fire7 () async {

  FirebaseFirestore db = await FirebaseFirestore.instance;

  QuerySnapshot querySnapshot = await db
      .collection("usuario")
      .get();


  for ( QueryDocumentSnapshot item in querySnapshot.docs) {

    dynamic dados = item.data();

    print("Dados: Usuario: " + dados["Nome"] + " - " + dados["idade"] + " - " + dados["sexo"] );
    //print("Dados: Usuario: " + dados.toString() );
  }

}

//Recuperar todos os dados e notifica auterações de um determinado banco de dados Firebase
Future<dynamic> fire8 () async {

  FirebaseFirestore db = await FirebaseFirestore.instance;

       await db
      .collection("usuario")
      .snapshots().listen(
      ( snapshot ){

        for ( QueryDocumentSnapshot item in snapshot.docs) {
          dynamic dados = item.data();

          print("Dados: Usuario: " + dados["Nome"] + " - " + dados["idade"] + " - " + dados["sexo"]);
        }
      }
  );
}