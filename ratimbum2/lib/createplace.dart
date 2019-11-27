import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:ratimbum2/model/db_test.dart';
import 'package:ratimbum2/showplace.dart';
import 'package:sqflite/sqflite.dart';
import 'model/place.dart';
import 'model/globals.dart' as globals;


class CreatePlace extends StatefulWidget{

  @override
  CreatePlaceState createState() => CreatePlaceState();
  
}
class CreatePlaceState extends State<CreatePlace>{
  TextEditingController nameController = new TextEditingController();
  TextEditingController observationsController = new TextEditingController();
  TextEditingController placeController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  Future<File> imageFile;
  File path;
  var database;
  CreatePlaceState();



  @override
  Widget build(BuildContext context) {

    
    final name = TextField(
      controller: nameController,
              obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Nome do Espaço",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),

    ) ;

    final observations = TextField(controller: observationsController,
          obscureText: false,
          decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Observações do local",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),
    );

    final local = TextField(controller: placeController,
          obscureText: false,
          decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Localização",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),
    );

    final phone = TextField(
      controller: phoneController,
              obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Telefone de Contato",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),

    ) ;

    var file;
    final uploadImage = RaisedButton(
      child: Text("Selecionar imagens"),
      onPressed: (){
        pickImageFromGallery(ImageSource.gallery);
      },
    );

    final fab = FloatingActionButton(onPressed: (){
      List<File> img = new List<File>();
      img.add(path);

      var place = new Place(null, nameController.text, placeController.text, observationsController.text, path.path, phoneController.text);
      place.createFile();
      print("AEEEE");
      globals.placelist.add(place);
      Navigator.push(context, MaterialPageRoute(builder: (context) => showPlace(place)));

    },
    child: Icon(Icons.save),
    );

    return Scaffold(floatingActionButton: fab,
    appBar: AppBar(),
    drawer: globals.selectdrawer(context),
    body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.all(36.0),
              child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        name,
        SizedBox(height: 25.0),
        showImage(),
        SizedBox(height: 25.0),
        uploadImage,
        SizedBox(height: 25.0),
        observations,
        SizedBox(height: 25.0),
        local,
        SizedBox(height: 25.0),
        phone,
      ],
    ),
    )
    )
    )
    );
  }
  
  Future<String> choose () async{
    print("entrei");
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    return file.path;
  }

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

    Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
              path = snapshot.data;
          return Image.file(
            snapshot.data,
            width: 300,
            height: 300,
          );

        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
 

}