import 'package:flutter/material.dart';
import 'package:ratimbum2/model/db_test.dart';
import 'package:ratimbum2/model/globals.dart' as globals;
import 'package:ratimbum2/register.dart';
import 'package:sqflite/sqflite.dart';
bool isloggedin = false;

Future<Database> database = null;

Widget selectdrawer(BuildContext context){
  if (globals.isloggedin){

    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('NOME'),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              title: Text('Cadastrar Espaços'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Gerenciar Espaços'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Container(
              alignment: FractionalOffset.bottomCenter,
              child: 
            ListTile(
              title: Text('Sair'),
              onTap: (){
                isloggedin = false;
                Navigator.pop(context);
              },
              ),
              color: Colors.red,          
            )
          ],
        ),
      );
  }
      return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Ra Tim Bum'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => sucesspage(emailController.text)));
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Cadastrar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => registerpage()));
              },
            ),
          ],
        ),
      );

}