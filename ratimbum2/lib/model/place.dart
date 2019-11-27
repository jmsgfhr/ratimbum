import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class Place{
  String name;
  String local;
  String observations;
  String imagepath;
  String phone;
  int id;


  Place(var id, String name, String local, String observations, String imagepath, String phone){
    this.id = id;
    this.name = name;
    this.local = local;
    this.observations = observations;
    this.imagepath = imagepath;
    this.phone = phone;
  }

  Map<String, dynamic> toJson(){
    return    {
      'name': name,
      'observations': observations,
      'local': local,
      'imagepath': imagepath,
      'phone': phone
    };
  }




    void createFile() async {
    var dir = await getApplicationSupportDirectory();
    print("Creating file!");
    File file = new File(dir.path + "/" + "criado.json");
    file.createSync();
    file.writeAsStringSync(toJson().toString());
    print(file.path);
    File file2 = File.fromUri(Uri.parse(dir.path+"/"+"criado.json"));
  }

}