import 'package:cloud_firestore/cloud_firestore.dart';
class VetementData{
  final CollectionReference listvetement = FirebaseFirestore.instance.collection("ListVet");

  Future getListVet() async {
    List vets = [];
    try{
      await listvetement.get().then((value) => {
        value.docs.forEach((element) {
          vets.add(element.data());
        })
      });
      return vets;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future getVeteDataDetail(String index) async {
    List vet = [];
    try{
      await listvetement.get().then((value) => {
        value.docs.forEach((element) {
          vet.add(element.data());
        })
      });
      return vet;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}