//https:ws.itcelaya.edy.mx:8080/intertecs/apirest/institucion/listado
//user: intertecs pass:1nt3rt3c5
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Lista extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return ListaState();
  }
}

class ListaState extends State<Lista>{
  List<String> lista=new List<String>();
  List data;
  final bottomMenu=Container(
    height: 55.0,
    child: BottomAppBar(
     color: Color.fromRGBO(58,66,86,1.0),
     child: Row(
       children: <Widget>[
         IconButton(
           icon: Icon(
             Icons.home,
             color: Colors.white
           ),
           onPressed: null,
         ),//icono 1
         IconButton(
           icon: Icon(
               Icons.home,
               color: Colors.white
           ),
           onPressed: null,
         ),//icono 2
         IconButton(
           icon: Icon(
               Icons.home,
               color: Colors.white
           ),
           onPressed: null,
         )//icono 3
       ],
     ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ejemplo de lista"),
        ),
        bottomNavigationBar: bottomMenu,
        body: ListView.builder(
          itemCount:lista.length,
          itemBuilder:(BuildContext context,int index){
            return Card(
            child:Container(
            padding: EdgeInsets.all(35.0),
            child:Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: new NetworkImage("http://i.pravatar.cc/300"),
                ),
                Text('nombre de la pelicula ${index}'),
              ],
            ),
            ),
            );
          }
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      for(int i=0;i<10;i++)
        lista.add("titlo de la pelicula ${i}");
    });
  }
}