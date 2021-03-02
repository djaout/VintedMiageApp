import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miaged_app/DataManagment/VetementData.dart';
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
  int currentIndexVet = 0;
  List listvetement = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listVetementFromFirestore();

  }
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
      body: Container(
        child: ListView.builder(
            itemCount: listvetement.length,
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  leading: Image.network(listvetement[index]['img']),

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
  listVetementFromFirestore() async {
    dynamic res = await VetementData().getListVet();
    if(res != null){
      setState(() {
        listvetement = res;
      });
    }else{
      print('impossible de recuperer les données');
    }
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

Widget buildVetDetails (int index){
    return GestureDetector(
      onTap: (){
        currentIndexVet = index;
      },
      child: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  leading: Image.network(listvetement[index]['img']),
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

}

