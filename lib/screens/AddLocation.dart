import 'dart:core';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fadyyyy/models/locationClass.dart';
import 'package:fadyyyy/screens/FavLocationsPage.dart';
class AddLocation extends StatefulWidget {
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  Location AddedLocation;
  String name = "";
  String image = "";
  String theme = "";
  String location = "";
  String description = "";
  final _formKey = GlobalKey<FormState>();

  void Add() {
    AddedLocation = Location(name: name,
        imageUrl: image,
        theme: theme,
        locationUrl: location,
        description: description);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Adding'),
            centerTitle: true,
          ),
          body: Column(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Row(children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Expanded(
                    child: TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter A Name': null,
                      onChanged: (value) => name = value,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        labelText: "Name",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10))
                ]),
                Row(children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Expanded(
                    child: TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter An Image': null,
                      onChanged: (value) => image = value,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        labelText: "Image",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10))
                ]),
                Row(children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Expanded(
                    child: TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter A Theme': null,
                      onChanged: (value) => theme = value,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        labelText: "Theme",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10))
                ]),
                Row(children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Expanded(
                    child: TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter A Location': null,
                      onChanged: (value) => location = value,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        labelText: "Location",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10))
                ]),
                Row(children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Expanded(
                    child: TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter A Description': null,
                      onChanged: (value) => description = value,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        labelText: "Description",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10))
                ]),
                Padding(padding: EdgeInsets.all(10)),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text(
                    'Add',

                    style: TextStyle(fontSize: 20,
                    ),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Adding'),));
                      await Future.delayed(Duration(seconds: 4));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FavLocationsPage()));

                    }

                    Add();
                    FavLocationsPage.locations.add(AddedLocation);

                  },

                )



              ])

      )




    );


  }
}












