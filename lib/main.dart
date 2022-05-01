import 'package:brn_firebase_aula/ImagensHome/ImagensHome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'fire.dart';
import 'fireFiltros.dart';
import 'FireNewUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main () async {


  //Iniciar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

//-------------Criando usuários (Criando usuário com e-mail e senha)------------

  //OBS: ativar no site do Firebase o método de autenticação desejado e se tiver...
  //usando emulador do android ativar o google play services .
  Future<dynamic> novoCadastro = novoUsuario();
  novoCadastro;

// -----------------------------------------------------------------------------
/*
// --Adicionando, auterando, e filtrando dados do DB firebase--(ver fire.dart)--

  Future<dynamic>  Fire  =  fire8();  //fire7(); fire6() ; fire5() ; fire4() ; fire3(); fire2() ; fire();
*/
//-------------------retornando dados com filtrto ------------------------------
/*
  Future<dynamic> Fire = fireFiltros();

  Fire;
*/
//------------------------------------------------------------------------------


  runApp(MaterialApp(

    home: ImagensHome(),


    title: 'Aula Firebase Flutter',
    debugShowCheckedModeBanner: false,

  ));
}


/*
1º - Copiar o Package dentro de (Project) - android, app, src, AndroidManifest.xml
     para o registro do firebase no site
2º - No campo Apelido (opcional) escolher um nome qualquer
3º - No certificado de assinaturas de depuração (opcional) serve para ativar outros
     recursos do fire base "não utilizado nesta aula". Ver documentação disponível
     no próprio campofild!
4º - Registrar o APP
5º - Fazer o download do arquivo de configurações (google-services.json) Copiar
     na raiz do projeto (android, app)
6º - Clicar em Próximo ( fazer as configurações recomendadas na página dentro do
     seu projeto 1º verificar o build.gradle na RAIZ do projeto (seguindo as
     orientações da página do firebase)
7º - Depois configurar o build.gradle NO NÍVEL DO PROJETO em: <project>/<app>/
     build.gradle): (seguindo as orientações da página do firebase)
8º - Configurar dependencias do AndroidX e multiDex no arquivo gradle.properties
     na raiz do projeto verificar se contém essas linhas (android.useAndroidX=true)
     (android.enableJetifier=true)
9º - Ativação do Multidex ( no arquivo build.grade em: android, app) adicionar em
     "defaultConfig" (multiDexEnable true) verificar o minSdkVersion "min 15" e o
     targetSdkVersion "min 28".
10º- No mesmo arquivo da fase 9º implementar a seguinte linha: em dependencies {
      implementation "androidx.multidex:multidex:2.0.1"
11º- no arquivo PUBSPEC.YAML inserir as dependencias: AS DEPENDENCIAS DEPENDE DO
     PROJETO EM QUE ESTÁ SENDO CRIADO E AS FUNCIONALIDADES DO MESMO EX: AUTENTI-
     CAÇÃO DO USUÁRIO, BANCO DE DADOS, TODOS PODEM SER ENCONTRADOS NO DARTPACKAGES.
12º- Inicializar o banco de dados do Firebase dentro do void main(){ abaixo:
*/



