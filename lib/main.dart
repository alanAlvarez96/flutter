import 'package:flutter/material.dart';
import 'package:hello_flutter/dashboard.dart';
import 'package:hello_flutter/login.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(
  MaterialApp(
    title: "Proyecto Flutter",
    home: new MyApp(),
  )
);

class MyApp extends StatefulWidget{
  _MyAppState createState() => new _MyAppState();
}


class _MyAppState extends State<MyApp>
{

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: Login(),
      title: Text("Bienvenidos",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: Image.network('https://upload.wikimedia.org/wikipedia/commons/d/d4/Logo-TecNM-2017.png'),
      //image: Image.asset("images/logo.png",width: 150, height: 150),
      gradientBackground: new LinearGradient(colors: [Colors.white, Colors.green], begin: Alignment.center, end: Alignment.bottomCenter),
      //backgroundColor: Colors.white,
      styleTextUnderTheLoader:  new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.red,
    );
  }
}

/*class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appBar: AppBar(title: Text("Primer Pantalla")),
      body: Center(
        child: RaisedButton(
          child: Image.asset("images/logo.png",width: 150, height: 150),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen())
            );
          },
        )
      ),
    );

  }
}*/

class SecondScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Segunda Pantalla")),
      body: Center(
        child: RaisedButton(
            child: Text("Regresar"),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
    );
  }
}

/*
class SplashScreen extends StatefulWidget{
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Image.asset("images/logo.png",width: 150, height: 150),
    );
  }

}*/
