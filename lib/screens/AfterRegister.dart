
import 'package:fadyyyy/main.dart';
import 'package:fadyyyy/screens/LoginPage.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Firebase.dart';
import 'FavLocationsPage.dart';

class AfterRegister extends StatelessWidget {
  const AfterRegister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Successful Register'),
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
                'Registered Successfully',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),

            ),


            RaisedButton(

              color: Colors.blue,
              textColor: Colors.white,
              onPressed: (){
                context.read<AuthService>().SignOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticationWrapper()));

              },
              child: Text(
                'Back To Home Page',

              ),
            )
          ],
        ),
      ),
    );
  }
}
