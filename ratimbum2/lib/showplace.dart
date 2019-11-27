import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ratimbum2/model/globals.dart';
import 'package:toast/toast.dart';

import 'model/place.dart';

class showPlace extends StatefulWidget{
  Place place;

  showPlace(this.place);
    @override
  ShowPlaceState createState() => ShowPlaceState(place);
}

class ShowPlaceState extends State<showPlace>{
  final Place place;
  ShowPlaceState(this.place);
  @override
  Widget build(BuildContext context) {
    FileImage img = FileImage(File.fromUri(Uri.parse(place.imagepath)));
    return Scaffold(
      appBar: AppBar(),
      drawer: selectdrawer(context),
      body: SingleChildScrollView(
        child:Column(
      
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
            Align(alignment: Alignment.centerLeft,
            child: Image(image: img,)),

            Align(child: Container(child:Text(place.name, style: TextStyle(fontSize: 50.0, color: Colors.orange))),
            alignment: Alignment.centerLeft),
            Align(child: Container(child:Text(place.local, style: TextStyle(fontSize: 18.0),)),
            alignment: Alignment.centerLeft,),
            SizedBox(height: 10.0),
            Align(child: Container(child:Text(place.observations, style: TextStyle(fontSize: 18.0),)),
            alignment: Alignment.centerLeft,),
            SizedBox(height: 25.0),
            SizedBox(height: 25.0),
            RaisedButton(child: Text("Entrar em Contato"),
            onPressed: (){
              showAlertDialog1(context);
              Toast.show("Contato ainda não implementado", context,duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              
            },)],
      ),
      )
    );
    
  }

  showAlertDialog1(BuildContext context) 
{ 
    // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { 
      Navigator.pop(context);
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Telefone de Contato"),
    content: Text(place.phone),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
 
}