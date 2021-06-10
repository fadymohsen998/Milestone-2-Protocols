import 'package:fadyyyy/Firebase.dart';
import 'package:fadyyyy/main.dart';
import 'package:fadyyyy/screens/AfterRegister.dart';
import 'package:fadyyyy/screens/FavLocationsPage.dart';
import 'package:fadyyyy/screens/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          title: Text('Register'),
          centerTitle: true,
        ),

        body: Form(
          key: _formKey,

          child: ListView(
            children: [

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Text(
                  'User Registeration',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),

              ),
              //SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                child:TextFormField(
                  validator: (val) => val.isEmpty ? 'Please Enter Your E-mail' : null,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',

                  ),

                ),
              ),

              //SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
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

              //SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                child:TextFormField(

                  obscureText: true,
                  validator: (val) => val.isEmpty ? 'Please Confirm Your Password' : null,
                  controller: confirmpasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                  ),


                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20),

                  ),

                  onPressed: () async{
                    if(_formKey.currentState.validate()){


                      Navigator.push(context, MaterialPageRoute(builder: (context) => AfterRegister()));

                    }

                    context.read<AuthService>().SignUp(
                      email: nameController.text,
                      password: passwordController.text,
                    );

                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have An Account?',
                      style: TextStyle(

                        fontSize: 17,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                      ),
                      onPressed: () async{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticationWrapper()));
                      },

                    )
                  ],
                ),

              )
            ],
          ),
        ),


      ),

    );
  }
}
