import 'package:fadyyyy/Firebase.dart';
import 'package:fadyyyy/screens/RegisterScreen.dart';
import 'package:flutter/material.dart';

import 'package:fadyyyy/screens/FavLocationsPage.dart';
import 'package:provider/provider.dart';

import 'AfterLogin.dart';
import 'RegisterScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fadyyyy/Firestore.dart';




class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() =>  _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

      return Scaffold(

            appBar: AppBar(
              title: Text('My First App'),
              centerTitle: true,
            ),
            body: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(50),
                        child: Text(
                          'Popular Locations',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Please Enter Your E-mail' : null,
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        validator: (val) => val.isEmpty ? 'Please Enter Your Password' : null,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: (){
                        //forgot password screen
                      },
                      textColor: Colors.blue,
                      child: Text('Forgot Password'),
                    ),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Sign In'),
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data'),));

                            }
                            await Future.delayed(Duration(seconds: 4));

                            context.read<AuthService>().SignIn(
                              email: nameController.text.trim(),
                              password: passwordController.text.trim(),
                            );



                          },
                        )),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'New User?',
                            ),
                            FlatButton(
                              textColor: Colors.blue,
                              child: Text(
                                'Register',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                //signup screen
                              },
                            ),

                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        )

                    ),

                  ],
                ))

        );

  }
}