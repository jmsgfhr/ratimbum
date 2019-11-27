
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ratimbum2/network/login.dart' as login;

class registerpage extends StatefulWidget{

  @override
  registerpagestate createState() => registerpagestate();
  
}

class registerpagestate extends State<registerpage>{
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmpwController = new TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailfield = TextField(
      controller: emailController,
      obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),
    );

    final password = TextField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),
    );
    
    final passwordconfirm = TextFormField(
      controller: confirmpwController,
      obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),
        validator: (value) {
          if (value!= passwordController.text){
            return 'Password Not Matching';
          }
          return null;
        },
    );

    final name = TextField(
        controller: nameController,
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Nome",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),
    );

    final registerbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.orange,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          login.loginhandler.register(context, emailController.text, passwordController.text, confirmpwController.text, nameController.text);
        },
        child: Text("Cadastrar", 
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xfafafaff)),
        ),
      ),
    );


    return Scaffold( 
      appBar: AppBar(
        title: Text("Cadastro"),
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
                  name,
                  SizedBox(height: 25.0),
                  emailfield,
                  SizedBox(height: 25.0),
                  password, 
                  SizedBox(height: 25.0),
                  passwordconfirm,
                  SizedBox(height: 25.0),
                  registerbutton
                ],        
              ),
            ),
          )
        )
      ),
    );

  }

  Color definecolor(){
    if (passwordController.text==confirmpwController.text){
      return Color(0x389283929);
    }
    else
      return Color(0x948192051);
  }

  
}