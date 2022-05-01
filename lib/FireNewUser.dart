import 'package:firebase_auth/firebase_auth.dart';

Future<dynamic> novoUsuario() async{

//-------------Criando usuários (Criando usuário com e-mail e senha)------------


  FirebaseAuth auth = FirebaseAuth.instance;

  String email = "teste_upload@gmail.com";
  String senha = "123456";

  auth.createUserWithEmailAndPassword(
      email: email,
      password: senha
  ).then( ( dynamic firebaseUser ) {

    print("Novo usuario: sucesso!!  e-mail " + firebaseUser.user?.email);

  }).catchError(( erro ){
    print("Novo usuario: ERRO!" + erro.toString());
  });

//------------------------Verificar usuário logado -----------------------------

  User? usuarioAtual = await auth.currentUser;

  if ( usuarioAtual != null ){ //logado
    print("Usuario atual Logado email: " + usuarioAtual.email.toString());

  }else{//deslogado
    print("Usuario atual DESLOGADO!!!: " );
  }

//------------------------Logando e deslogando usuário-----(Autenticação)-------

/*
     //auth.signOut(); // Deslogando o usuário

     // Logando o usuário e autenticando
      auth.signInWithEmailAndPassword(
          email: email,
          password: senha
      ).then(( dynamic firebaseUser ){
        print("Logar usuario: Sucesso!! e-mail  " + firebaseUser.user?.email );
      }).catchError(( erro ){
        print("Logar usuario: ERRO!" + erro.toString());
      });
*/
}
// -----------------------------------------------------------------------------
