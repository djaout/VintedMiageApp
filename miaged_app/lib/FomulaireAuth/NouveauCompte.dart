import 'package:flutter/material.dart';
import '../ServiceAuthentification/AuthServices.dart';

class NouveauCompte extends StatefulWidget{
  NouveauCompte({Key key}) : super(key: key);
  @override
  _NouveauCompteState createState() => _NouveauCompteState();
}

class _NouveauCompteState extends State<NouveauCompte> {
  // utiliser la classe AuthServices pour push les data du user vers firbase
  AuthServices _auth = AuthServices();

  final _formkey = GlobalKey<FormState>(); //sert a identifier le formulaire

  //variables pour la validation du formulaire : appliquer des condition de saisi des donnees
  TextEditingController nom = TextEditingController();
  TextEditingController prenom =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController mdp =TextEditingController();
  TextEditingController cmdp =TextEditingController();




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
                Image.asset("images/logo.png", height : 100, width: 100),
                SizedBox(height: 20.0),  // faire de l espace entre le logo et le form
                TextFormField(
                  controller: nom,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (val) => val.isEmpty ? 'Ce champ est requis' : null,
                  onChanged: (val) => nom,
                ),
                SizedBox(height: 20.0),  // faire de l espace entre le logo et le form
                TextFormField(
                  controller: prenom,
                  decoration: InputDecoration(
                    labelText: 'Prenom',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (val) => val.isEmpty ? 'Ce champ est requis' : null,
                  onChanged: (val) => prenom,
                ),
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
                TextFormField(
                  controller: cmdp,
                  decoration: InputDecoration(
                    labelText: 'Confirmez le mot de passe',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (val) => val.length < 8 ? 'Le mdp doit contenir minimum 8 caractères' : null,
                  onChanged: (val) => cmdp,

                  obscureText: true,
                ),
                SizedBox(height: 20.0),  // faire de l espace entre le logo et le form
                FlatButton(
                  minWidth: 50.0,
                  height: 50.0,
                  onPressed: (){
                   if(_formkey.currentState.validate()){
                     AjouterAFB();
                   }
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => ListeVetements()));
                  },
                  color: Colors.green,
                  child: Text('Inscription'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void AjouterAFB() async {
    dynamic result = await _auth.creerUnUser(email.text, mdp.text);
    if(result != null){
      print(result.toString());
      nom.clear(); prenom.clear(); email.clear(); mdp.clear(); cmdp.clear();
      Navigator.pop(context);
    }else{
      print('invalid email...');
    }
  }
}



