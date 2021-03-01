import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class VetementModelDetails extends StatefulWidget{
  @override
  _VetementModelDetailsState createState() => _VetementModelDetailsState();
}

class _VetementModelDetailsState extends State<VetementModelDetails>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
        stream : FirebaseFirestore.instance.collection("ListVet").snapshots(),
        builder : (context, snapshot) {
          return  ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index){
                DocumentSnapshot vetement = snapshot.data.docs[index];
                return Card(
                  child: ListTile(
                    title: Text(vetement[index]['titre'] ),
                    leading: Image.network(vetement[index]['img']),
                    subtitle: Text(vetement[index]['taille']),
                    trailing: Text(vetement[index]['prix']) ,
                  ),
                );
              }
          );
        }

      ),
    );

  }
}