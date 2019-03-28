import 'package:flutter/material.dart';
class Conversor extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ConversorState();
  }
}
class ConversorState extends State<Conversor>{
  final myController=TextEditingController();
  int gF;
  double gC;
  String gradosF,gradosC;
  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final txtFahrenheit=TextFormField(
      keyboardType:TextInputType.number,
      controller: myController,
      decoration: InputDecoration(
        hintText:'Grados a convertir',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final changeF=Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed:(){
          gradosF=myController.text;
          gF=int.parse(gradosF);
          gC=(gF-32)*(5/9);
          gradosC=gC.toString();
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text(gradosC),
              );
            }
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Centigrados', style: TextStyle(color: Colors.white)),
      ),
    );
    final changeC=Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed:(){
          gradosF=myController.text;
          gF=int.parse(gradosF);
          gC=(gF*(9/5))+32;
          gradosC=gC.toString();
          return showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  content: Text(gradosC),
                );
              }
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Fahrenheit', style: TextStyle(color: Colors.white)),
      ),
    );
    return Scaffold(
      backgroundColor:Colors.white,
      body:Center(
        child:ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 40.0),
            txtFahrenheit,
            SizedBox(height: 30.0),
            changeF,
            changeC
          ],
        ),
      ),
    );
  }
}