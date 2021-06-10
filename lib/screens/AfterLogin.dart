import 'package:fadyyyy/Firebase.dart';
import 'package:fadyyyy/screens/FavLocationsPage.dart';
import 'package:fadyyyy/screens/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AfterLogin extends StatelessWidget {
  const AfterLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Successful Sign In'),
        centerTitle: true,
      ),
       body: Padding(
         padding: EdgeInsets.all(60),
         child: ListView(
           children: [
             Container(
               height: 150,
               alignment: Alignment.center,
               child: Text(
                 'You Have Been Signed In Successfully',
                 style: TextStyle(
                   fontSize: 15,
                 ),
               ),

             ),
             RaisedButton(
               color: Colors.blue,
               textColor: Colors.white,
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => FavLocationsPage()));
                 },
                 child: Text(
                   'Go To Locations',

                 )

             ),

             RaisedButton(

               color: Colors.blue,
               textColor: Colors.white,
               onPressed: (){
                 context.read<AuthService>().SignOut();

               },
               child: Text(
                 'Sign Out',

               ),
                 )
           ],
         ),
       ),
    );

  }
}
