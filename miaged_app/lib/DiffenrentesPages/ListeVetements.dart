import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miaged_app/DiffenrentesPages/VetementModelDetails.dart';
import 'package:miaged_app/ServiceAuthentification/AuthServices.dart';

class ListeVetements extends StatefulWidget{
  ListeVetements({Key key}) : super(key: key);
  @override
  _ListeVetementsState createState() => _ListeVetementsState();
  
}

class _ListeVetementsState extends State<ListeVetements> {
  AuthServices _auth = AuthServices();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Text('MiageVintedApp'),
        actions: [
          RaisedButton(
              onPressed: () async {
                   await _auth.deconnexion().then((result){
                      Navigator.of(context).pop(true);
                  });
              },
            child: Icon(Icons.exit_to_app, color : Colors.green),
          ),
        ],
      ),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          buildListVet(),
        ],
      ),
      // Center(        child:  buildListVet(),  ),
      //Text("vous etes sur la page $currentIndex"),



      bottomNavigationBar: Row(
        children: <Widget>[
          buildIteminNavigationButton(Icons.home, 0),
          buildIteminNavigationButton(Icons.account_circle, 1),
          buildIteminNavigationButton(Icons.add_shopping_cart,2),
        ],
      ),
    );
  }
  Widget buildIteminNavigationButton(IconData iconData, int index){
    return  GestureDetector(
      onTap: (){
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(this.context).size.width/3,
        decoration: BoxDecoration(
          color: index == currentIndex ? Colors.green : Colors.white,
        ),
        child: Icon(iconData),
      ),
    );
}

  Widget buildListVet(){
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("ListVet").snapshots(),
        builder: (context, snapshot){
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index){
              DocumentSnapshot vetement = snapshot.data.docs[index];
              return GestureDetector(
                onTap: (){
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => VetementModelDetails()));
                },

                child: ListTile(
                  leading: Image.network(vetement['img']),
                  title: Text(vetement['titre'] ),
                ),
             );
              },

          );
        }
    );
  }
}
/*
Widget showDialogFunc(BuildContext context, img, titre, taille, prix){
  return  Scaffold(
    body: StreamBuilder(
        builder : (context, snapshot) {
          return  ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    title: Text(titre ),
                    leading: Image.network(img),
                    subtitle: Text(taille),
                    trailing: Text(prix) ,
                  ),
                );
              }
          );
        }

    ),
  );

 */
/*
showDialogFunc(BuildContext context, img, titre, taille, prix) {
  return showDialog(
      context: context,
      builder: (context){
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color : Colors.green,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width *0.7,
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius : BorderRadius.circular(5),
                    child: Image.asset(
                      img,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    titre,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Taille :  $taille',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Prix :  $prix € ',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }
  );
}

 */


