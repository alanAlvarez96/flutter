import 'package:flutter/material.dart';
import 'Lista.dart';
import 'Conversor.dart';
class DashBoard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Dashboard",
      home: MenuLateral(),
    );
  }
}


class MenuLateral extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MenuLateralState();
  }
}

class MenuLateralState extends State<MenuLateral>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Cine"),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green
              ),
              accountName: Text("Alan Alvarez"),
              accountEmail: Text("15030093@itcelaya.edu.mx"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
            ListTile(
              title: Text("Peliculas"),
              trailing: Icon(Icons.account_circle),
              onTap: (){
                // Cerramos el drawer
                Navigator.push(context,
                  MaterialPageRoute(
                      builder:(BuildContext context)=>new Lista()
                  )
                );
              },
            ),
            ListTile(
              title: Text("Conversor"),
              trailing: Icon(Icons.autorenew),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(
                    builder:(BuildContext context)=>new Conversor())
                );
              },
            ),
            ListTile(
              title: Text("Acerca de"),
              trailing: Icon(Icons.account_box),
              onTap: (){
                // Cerramos el drawer
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

/*
// CREAMOS EL WIDGET COMPLETO Y DEFINIMOS LA CLASE DONDE ESTARAN SUS DATOS
class MiFormulario extends StatefulWidget{
  @override
  _MiFormularioState createState() => _MiFormularioState();
}

// CLASE CON LOS DATOS Y ELEMENTOS DEL WIDGET
class _MiFormularioState extends State<MiFormulario>{

  final miControlador = TextEditingController();
  double resultado;

  @override
  void dispose() {
    // TODO: implement dispose
    miControlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Temperatura"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: miControlador,
          keyboardType: TextInputType.number,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          resultado = double.parse(miControlador.text) * 1.8 + 32;
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(content: Text("La temperatura en Fahrenheit es : $resultado"));
            },
          );
        },
        tooltip: "Presiona para convertir",
        child: Icon(Icons.text_fields),
      ),
    );
  }
}*/