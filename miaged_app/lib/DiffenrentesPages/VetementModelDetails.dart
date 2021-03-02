import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/DataManagment/VetementData.dart';

import 'ListeVetements.dart';
class VetementModelDetails extends StatefulWidget{
  @override
  _VetementModelDetailsState createState() => _VetementModelDetailsState();
}

class _VetementModelDetailsState extends State<VetementModelDetails>{
  List listvetement = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vetementDataFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
      backgroundColor: Colors.green,
      automaticallyImplyLeading: false,
      title: Text('MiageVintedApp'),
      actions: [
        RaisedButton(
          onPressed: () async {
            // retour à la page list vetement
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListeVetements()));
          },
          child: Icon(Icons.arrow_back),
        ),
      ],
    ),
      body: Container(
        child: ListView.builder(
            itemCount: listvetement.length,
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.network(listvetement[index]['img']),
                  ),
                  title: Text(listvetement[index]['titre']),
                  subtitle: Text("Taille $listvetement[index]['taille']"),
                  trailing: TextButton(
                      child: Text('Details'),
                      onPressed: () {
                        //rediriger vers la page details
                      }
                  ),
                ),
              );

            }
        ),
      ),

    );

  }

    vetementDataFromFirestore() async {
      dynamic res = await VetementData().getListVet();
      if(res != null){
        setState(() {
          listvetement = res;
        });
      }else{
        print('impossible de recuperer les données');
      }
    }
}