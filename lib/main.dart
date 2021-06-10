



import 'package:fadyyyy/Firebase.dart';
import 'package:fadyyyy/screens/AfterLogin.dart';
import 'package:fadyyyy/screens/FavLocationsPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fadyyyy/screens/LoginPage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
              create: (_) => AuthService(FirebaseAuth.instance) ),
          StreamProvider(
              create: (context) => context.read<AuthService>().authStateChanges)
          
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthenticationWrapper(),
      ),

    );
  }
  
  
}
class AuthenticationWrapper extends StatelessWidget {
  //const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final firebaseUser = context.watch<User>();
    if(firebaseUser != null){
      return AfterLogin();
    }
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong E-mail Or Password'),));
    return LoginPage();


  }
}












