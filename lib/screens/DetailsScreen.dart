


import 'package:flutter/cupertino.dart';


import 'package:fadyyyy/models/locationClass.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';






// ignore: must_be_immutable, camel_case_types
class locationDescription extends StatelessWidget {
  Location L;
  locationDescription({this.L});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(25),),

          Container(
            width: 250,
            height: 250,
            child: Image.network(L.imageUrl),
          ),
          Padding(padding: EdgeInsets.all(20)),

          Container(
            alignment: Alignment.center,
              child: Text(
                L.description,
                style: TextStyle(fontSize: 20,),
              )),
          Padding(padding: EdgeInsets.all(20)),
         Container(
           height: 40,
             padding: EdgeInsets.fromLTRB(15, 0, 15, 0),



         ),
          Padding(padding: EdgeInsets.all(10))



        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location_alt),
        onPressed: () {
          launch(L.locationUrl);

        },
      ),

    );
  }


}