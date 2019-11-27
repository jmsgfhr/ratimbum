import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart' as toast;

class loginhandler{
  String email;
  static String baseurl = "https://muda-api.herokuapp.com/auth/";


  static Future<int> register(BuildContext context, String email, String password, String passwordConfirmation, String name) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = ' { "name": "'+name+'", "email": "'+email+'","password": "'+password+'"}';
    print(json);
    if (password!=passwordConfirmation){
      toast.Toast.show("Senhas nao conferem", context,duration: toast.Toast.LENGTH_LONG, gravity: toast.Toast.BOTTOM);
      return 0;
    }

    var url = baseurl;
    var response = await http.post(url, headers: headers, body: json);
    print(response.statusCode);    
    print(response.body);
    if(response.statusCode==200)
    toast.Toast.show("cadastro realizado com sucesso", context,duration: toast.Toast.LENGTH_LONG, gravity: toast.Toast.BOTTOM);
    else
      toast.Toast.show("cadastro falhou", context,duration: toast.Toast.LENGTH_LONG, gravity: toast.Toast.BOTTOM);

  }

  static Future<int> sign_in(BuildContext context, String email, String password) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{ "email": "'+email+'","password": "'+password+'"}';
    print(json);
    var url = baseurl +"sign_in";
    var response = await http.post(url, headers: headers, body: json);
    print(response.statusCode);    
    print(response.body);
    if(response.statusCode==200)
      //toast.Toast.show("login realizado com sucesso", context,duration: toast.Toast.LENGTH_LONG, gravity: toast.Toast.BOTTOM);
      return 1;
    else
      //toast.Toast.show("email/senha incorreto", context,duration: toast.Toast.LENGTH_LONG, gravity: toast.Toast.BOTTOM);
      return 0;
  }

}