import 'package:cloud_firestore/cloud_firestore.dart';

Future<dynamic> fireFiltros () async {

  FirebaseFirestore db = await FirebaseFirestore.instance;

  QuerySnapshot querySnapshot = await db
      .collection("usuario")
  //.where("Nome", isEqualTo: "Bruno")
  //.where("idade", isEqualTo: "34")


  //Pesquisa parte do texto só que no caso de textos iguais precisamos inserir
  // o caracter especial para indicar que um é maior que o outro (só em textos) "\uf8ff"
      //.where("Nome" , isGreaterThanOrEqualTo: "B")
      //.where("Nome" , isLessThanOrEqualTo: "B" + "\uf8ff") //sugere criar uma variável para pesquisa

      .where("idade", isGreaterThan: "17") // > que
      .where("idade", isLessThan: "50") //< que
      .orderBy("idade", descending: true) // mudar para false exibe em forma ascendente
      .orderBy("Nome", descending: false)
      .orderBy("sexo", descending: false)// demonstra a possibilidade de ordenar por mais de um...
  // campo porem dará um erro com um link que te redicionará para o firebase para criar um índice
  //.limit(5) // Limite de retorno

      .get();

  for ( QueryDocumentSnapshot item in querySnapshot.docs) {
    dynamic dados = item.data();

    print("Filtrando :  ${dados["Nome"]}  idade: ${dados["idade"]}  //sexo: ${dados["sexo"]}");
  };
}

