import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/FomulaireAuth/Login.dart';
import 'package:miaged_app/FomulaireAuth/NouveauCompte.dart';


class PageAccueil extends StatefulWidget{
  PageAccueil({Key key}) : super(key: key);
  @override
  _PageAccueilState createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  final _formkey = GlobalKey<FormState>();
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
                MaterialButton(
                  minWidth: 50.0,
                  height: 50.0,
                  onPressed: (){
                    //if(_formkey.currentState.validate()){}
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  color: Colors.green,
                  child: Text('Se connecter'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                SizedBox(height: 20.0),  // faire de l espace entre le logo et le form
                MaterialButton(
                  minWidth: 50.0,
                  height: 50.0,
                  onPressed: (){
                    //if(_formkey.currentState.validate()){}
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NouveauCompte()));

                  },
                  color: Colors.green,
                  child: Text('Inscritpion'),
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
}