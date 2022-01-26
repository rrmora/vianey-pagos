import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar cliente'),
        actions: [IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'clientsList');
          })],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        children: [ Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                  title: new Row(children: <Widget>[new Text('Información Personal',
                  style: new TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 25.0),)
                    ], mainAxisAlignment: MainAxisAlignment.center,),
                  ),
                  TextFormField(  
                  decoration: const InputDecoration(  
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                    labelStyle:   TextStyle(color: Colors.black87),
                    icon: const Icon(Icons.person, color: Colors.indigo),  
                    hintText: 'Nombre',  
                    labelText: 'Nombre',  
                  ),  
                ), 
                SizedBox( height: 10 ),
                TextFormField(  
                  decoration: const InputDecoration(  
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                    labelStyle:   TextStyle(color: Colors.black87),
                    icon: const Icon(Icons.person, color: Colors.indigo),  
                    hintText: 'Apellido',  
                    labelText: 'Apellido',  
                  ),  
                ),
                SizedBox( height: 10 ),
                TextFormField(  
                  decoration: const InputDecoration(  
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                    labelStyle:   TextStyle(color: Colors.black87),
                    icon: const Icon(Icons.home, color: Colors.indigo),   
                    hintText: 'Dirección',  
                    labelText: 'Dirección',  
                  ),  
                ),
                SizedBox( height: 10 ),
                TextFormField(  
                  decoration: const InputDecoration(  
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                    labelStyle:   TextStyle(color: Colors.black87),
                    icon: const Icon(Icons.phone, color: Colors.indigo),  
                    hintText: 'Teléfono',  
                    labelText: 'Teléfono',  
                  ),  
                ), 
                 Center(  
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        disabledColor: Colors.grey,
                        elevation: 0,
                        color: Colors.deepPurple,
                        child: Container(
                          padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                          child: Text(
                            'Agregar',
                            style: TextStyle( color: Colors.white ),
                          )
                        ),
                        onPressed: () {}
                      ),
                    )
                    )
                ],
              ),
            )
          ),
        )
        ]
      )
    );
  }
}