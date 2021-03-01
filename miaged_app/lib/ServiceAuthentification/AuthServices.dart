import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Inscritpion avec un nom, prenom, email et mot de passe
  Future creerUnUser(String email, String mdp) async {
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email.trim(), password: mdp);
      User util = result.user;
      return util;
    }catch(e){
      print(e.toString());
    }
  }
  // connexion avec un email et mot de passe
   Future connexionUser(String email, String mdp) async {
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email.trim(), password: mdp);
      return result.user;
    }catch(e){
      print(e.toString());
    }
   }
  //deconnection
   Future deconnexion() async{
    try{
      return auth.signOut();
    }catch(e){
      print(e.toString());
          return null;
    }

  }
}