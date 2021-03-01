import 'package:flutter/material.dart';
import 'package:miaged_app/DiffenrentesPages/ListeVetements.dart';
import 'package:miaged_app/ServiceAuthentification/AuthServices.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // utiliser la classe AuthServices pour push les data du user vers firbase
  AuthServices _auth = AuthServices();

  final _formkey = GlobalKey<FormState>();
  //variables pour la validation du formulaire : appliquer des condition de saisi des donnees
  TextEditingController email =TextEditingController();
  TextEditingController mdp =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, //pour aligner les champs et pour qu'ils prennent tous l'espace de la page
              children: <Widget>[
                SizedBox(height: 100.0),
                Image.asset("images/logo.png", height : 100, width: 100),
                SizedBox(height: 20.0),  // faire de l espace entre le logo et le form
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (val) => val.isEmpty ? 'Ce champ est requis' : null,
                  onChanged: (val) => email,
                ),
                SizedBox(height: 20.0),  // faire de l espace entre le logo et le form
                TextFormField(
                  controller: mdp,
                  decoration: InputDecoration(
                    labelText: 'mot de passe',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (val) => val.length < 8 ? 'Le mdp doit contenir minimum 8 caractères' : null,
                  onChanged: (val) => mdp,
                  obscureText: true,
                ),
                SizedBox(height: 20.0),  // faire de l espace entre le logo et le form
                FlatButton(
                  minWidth: 50.0,
                  height: 50.0,
                  onPressed: (){
                    if(_formkey.currentState.validate()){
                      UserLogin();
                    }

                  },
                  color: Colors.green,
                  child: Text('Se connecter'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void UserLogin() async{
    dynamic authResult = await _auth.connexionUser(email.text, mdp.text);
    if(authResult != null){
      print('connexion réussite');
      email.clear(); mdp.clear();
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListeVetements()));
    }else{
      print('login incorrect');
    }
  }
}