



import 'package:fadyyyy/Firestore.dart';
import 'package:fadyyyy/main.dart';
import 'package:fadyyyy/screens/FavLocationsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'data/Locations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fadyyyy/Firestore.dart';
import 'package:fadyyyy/main.dart';
import 'package:fadyyyy/models/locationClass.dart';
import 'package:fadyyyy/data/Locations.dart';


class AuthService{
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  Future <void> SignOut() async{
   await _firebaseAuth.signOut();
  }

  Future<String> SignIn({String email, String password}) async{
    try{
      //await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      List<Location> FavouriteLocations=[];
      UserCredential  result= await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User user =result.user;
      await DatabaseManager.LocationsRef.doc(user.uid).collection('Locations').get().then((querySnapshot) {

        querySnapshot.docs.forEach((element) {FavouriteLocations.add(Location(theme:element.get('theme'),
            name: element.get('name'),
            description: element.get('description'),
            imageUrl: element.get('imageUrl'),
            locationUrl: element.get('locationUrl'),
            id: int.parse(element.id)));});

    });
      FavLocationsPage.locations=FavouriteLocations;
      FavLocationsPage.uid=user.uid;
      return "Signed In";
          }on FirebaseAuthException catch(e){
      return e.message;

    }
  }
  Future<String> SignUp({String email, String password, String confirmpassword}) async{
    try{
      //await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      UserCredential  result= await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      User user =result.user;
      List<Location> locations= locationsAll().listobj;
      FavLocationsPage.locations=locations;
      //await DatabaseManager.UpdateData(locations,user.uid);
      //return "Signed Up";

    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }
}
