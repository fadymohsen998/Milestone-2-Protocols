import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fadyyyy/models/locationClass.dart';

class DatabaseManager {
  static CollectionReference LocationsRef =
  FirebaseFirestore.instance.collection('Locations');

  static Future<void> createUserData(
      String name, String description, String theme, String imageUrl, String locationUrl, ) async {
    return await LocationsRef
        .doc()
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

}