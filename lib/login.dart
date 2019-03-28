import 'dart:async';
import 'dart:convert';
import 'dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}
 class LoginState extends State<Login>{
   final mailController=TextEditingController();
   final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    Future<String> login() async {
      var url="http://192.168.1.145:3000/api/Usuarios/login";
      Map validate;
      http.post(url,body: {
        "correo":mailController.text,
        "password":passwordController.text
      }).then((response){
        print("status:${response.statusCode}");
        print("respuesta:${response.body}");
        validate=jsonDecode(response.body);
        print(validate);
        if(validate['valid']==1){
          print("puede pasar ");
          Navigator.push(context,
              MaterialPageRoute(
                  builder:(BuildContext context)=>new DashBoard()
              ));
        }
        if(validate['valid']==2){
          print("no puede pasar");
          return showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  content: Text("Contraseña o password incorrectos"),
                );
              }
          );
        }

      });
      //List data = json.decode(response);
      //print(data[1]["title"]);

    }

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        radius: 48.0,
        child: Image.asset("images/logo.png"),
      ),
    );

    final txtEmail = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: mailController,
      //autofocus: false,
      decoration: InputDecoration(
        hintText: 'Introduce el e-mail',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final txtPwd = TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Introduce el password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed:(){
          login();

        },
        padding: EdgeInsets.all(12),
        color: Colors.lightGreen,
        child: Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 40.0),
            txtEmail,
            SizedBox(height: 30.0),
            txtPwd,
            SizedBox(height: 30.0),
            loginButton
          ],
        ),
      ),
    );
  }
 }