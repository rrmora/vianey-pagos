import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/ui/input_decorations.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordercustom = [];
    final client = ModalRoute.of(context)!.settings.arguments as OrderCustom;
    Product product = new Product();
    return Scaffold(
      body:  ListView(
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
                  title: new Row(children: <Widget>[new Text('Agregar Producto',
                  style: new TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.0),)
                    ], mainAxisAlignment: MainAxisAlignment.center,),
                  ),
                  TextFormField(  
                    initialValue: product.productName,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: 'Nombre',
                      labelText: 'Nombre',
                      prefixIcon: Icons.description
                    ),
              // onChanged: ( value ) => loginForm.email = value,
              // validator: ( value ) {

              //     String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              //     RegExp regExp  = new RegExp(pattern);
                  
              //     return regExp.hasMatch(value ?? '')
              //       ? null
              //       : 'El valor ingresado no luce como un correo';

              // },
            
                  // decoration: const InputDecoration(  
                  //   focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                  //   labelStyle:   TextStyle(color: Colors.black87),
                  //   icon: const Icon(Icons.person, color: Colors.indigo),  
                  //   hintText: 'Nombre',  
                  //   labelText: 'Nombre',  
                  // ),  
                ), 
                SizedBox( height: 10 ),
                TextFormField(  
                  initialValue: product.quantity.toString(),
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Cantidad',
                    labelText: 'Cantidad',
                    prefixIcon: Icons.production_quantity_limits
                  ),
                  // decoration: const InputDecoration(  
                  //   focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                  //   labelStyle:   TextStyle(color: Colors.black87),
                  //   icon: const Icon(Icons.person, color: Colors.indigo),  
                  //   hintText: 'Apellido',  
                  //   labelText: 'Apellido',  
                  // ),  
                ),
                SizedBox( height: 10 ),
                TextFormField(  
                  initialValue: product.price.toString(),
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  enabled: false,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Total',
                    labelText: 'Total',
                    prefixIcon: Icons.money
                  ),
                  // decoration: const InputDecoration(  
                  //   focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                  //   labelStyle:   TextStyle(color: Colors.black87),
                  //   icon: const Icon(Icons.home, color: Colors.indigo),   
                  //   hintText: 'Dirección',  
                  //   labelText: 'Dirección',  
                  // ),  
                ), 
                 Column(  
                   crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: IconButton(
                                iconSize: 35,
                                icon: const Icon(Icons.arrow_back),
                                color: Colors.grey,
                                tooltip: 'Regresar',
                                onPressed: () {
                                   Navigator.pushNamed(context, 'orderDetail', arguments: client);
                                },
                              ),
                            ), 
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: IconButton(
                                iconSize: 35,
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                                tooltip: 'Eliminar',
                                onPressed: () {
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: IconButton(
                                iconSize: 35,
                                icon: const Icon(Icons.save),
                                color: Color.fromRGBO(118, 35, 109, 1),
                                tooltip: 'Guardar',
                                onPressed: () {
                                },
                              ),
                            )
                          ]
                        ),
                      )
                    ] 
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 15),
                    //   child: MaterialButton(
                    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    //     disabledColor: Colors.grey,
                    //     elevation: 0,
                    //     color: Color.fromRGBO(118, 35, 109, 1),
                    //     child: Container(
                    //       padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                    //       child: Text(
                    //         'Agregar',
                    //         style: TextStyle( color: Colors.white ),
                    //       )
                    //     ),
                    //     onPressed: () {}
                    //   ),
                    // )
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
