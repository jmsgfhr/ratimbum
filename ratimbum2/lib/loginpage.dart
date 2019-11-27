import 'package:flutter/material.dart';
import 'package:ratimbum2/network/login.dart';
import 'package:ratimbum2/register.dart';
import 'package:ratimbum2/sucesspage.dart';
import 'package:ratimbum2/model/globals.dart' as globals;

class LoginPage extends StatelessWidget {


  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Ra Tim Bum'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final emailfield = TextField(
      controller: emailController,
      obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          focusColor: Colors.orange, 
          hoverColor: Colors.orange
        ),
    );

    final passwordField = TextField(obscureText: true,
        controller: passwordController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          focusColor: Colors.orange
        ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.orange,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          globals.isloggedin = true;
          loginhandler.sign_in(context, emailController.text, passwordController.text);
          Navigator.push(context, MaterialPageRoute(builder: (context) => sucesspage(emailController.text)));
        },
        child: Text("Login", 
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xfafafaff)),
        ),
      ),
    );



    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: "Pesquisar"),
        ),
        backgroundColor: Colors.orange
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.all(36.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                emailfield,
                SizedBox(height: 25.0),
                passwordField, 
                SizedBox(height: 25.0),
                loginButton,
              ],        
            ),
          ),
          )
        )
      ),
    drawer: globals.selectdrawer(context)
    );
  }
}