import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fadyyyy/models/locationClass.dart';

class DatabaseManager {
  static CollectionReference LocationsRef =
  FirebaseFirestore.instance.collection('Locations');

  Future<void> createUserData(
      String name, String description, String theme, String imageUrl, String locationUrl, String AddedLocation) async {
    return await LocationsRef
        .doc(AddedLocation)
        .set({'name': name, 'description': description, 'theme': theme, 'imageUrl': imageUrl, 'locationUrl': locationUrl});
  }

  Future updateUserList(String name, String description, String theme, String imageUrl, String locationUrl, String AddedLocation) async {
    return await LocationsRef.doc(AddedLocation).update({
      'name': name, 'description': description, 'theme': theme, 'imageUrl': imageUrl, 'locationUrl': locationUrl
    });
  }

  Future getLocations() async {
    List itemsList = [];

    try {
      await LocationsRef.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
   static Future UpdateData(List<Location> locations, String ID) async{
    for(int i =0;i<locations.length;i++){
      await LocationsRef.doc(ID).collection('Locations').doc(i.toString()).set(
          { 'name': locations[i].name,
            'description':locations[i].description
            ,  'theme': locations[i].theme,
            'imageUrl':locations[i].imageUrl,

            'locationUrl':locations[i].locationUrl
          });
    }
    return null;
  }
}