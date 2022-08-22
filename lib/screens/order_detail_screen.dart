import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/ui/input_decorations.dart';

class OrderDetailScreen extends StatelessWidget {

  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  List<Product> products = [];
  OrderCustom orderCustom = new OrderCustom();
    final clientCustom = ModalRoute.of(context)!.settings.arguments as ClientCustom;
    Client client = clientCustom.client as Client;
    String id = clientCustom.id ?? '';
    final order = client.orders!.length > 0 ? client.orders?.where((element) => element.id == id).first : null;
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar orden')
      ),
      
      
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        children: [ Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                  title: new Row(children: <Widget>[new Text('Agregar orden a: '+ client.name,
                  style: new TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.0),)
                    ], mainAxisAlignment: MainAxisAlignment.center,),
                  ),
                  TextFormField(  
                    initialValue: order != 0 ? order?.orderDate : null,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: 'Fecha',
                      labelText: 'Fecha',
                      prefixIcon: Icons.date_range_outlined
                    ),
                ), 
                SizedBox( height: 10 ),
                TextFormField(  
                  initialValue: order != 0 ? order?.comment : null,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Comentario',
                    labelText: 'Comentario',
                    prefixIcon: Icons.comment
                  ) 
                ),
                SizedBox( height: 10 ),
                TextFormField(  
                  initialValue: order != 0 && order != null ? '\$ 100' : null, // '\$ ' + order! != 0 ? '' : '' , // order?.products.map((e) => e.price).reduce((value, element) => value + element).toStringAsFixed(2),
                  autocorrect: false,
                  enabled: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Total',
                    labelText: 'Total de está orden',
                    prefixIcon: Icons.monetization_on
                  ) 
                ),
        SizedBox( height: 5 ),
        Center(  
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MaterialButton(
              minWidth: 20,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color.fromRGBO(118, 35, 109, 1),
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                final rest = client;
                orderCustom.client = rest;
                orderCustom.order = order != null ? order : null;
                Navigator.pushNamed(context, 'productDetail', arguments: orderCustom);
              }
            ),
          )
        ),
      Container(
        width: double.infinity,
        child: DataTable( 
          showCheckboxColumn: false,
          columnSpacing: 10.0,
          columns: [
            DataColumn(label: Text('')),
            DataColumn(label: Text('Nombre', style: TextStyle(fontSize: 17))),
            DataColumn(label: Text('Cantidad', style: TextStyle(fontSize: 17))),
            DataColumn(label: Text('Total', style: TextStyle(fontSize: 17))),
          ],
          rows:
            order != null ? order.products.map<DataRow>((e) => DataRow(
              cells: [
                DataCell(Icon(Icons.edit, color: Colors.grey, size: 27), onTap: () => {
                  print(e)
                },),
                DataCell(Text(e.productName.toString(), style: TextStyle(fontSize: 15))),
                DataCell(Center(child: Text(e.quantity.toString(), style: TextStyle(fontSize: 15)))),
                DataCell(Text(e.quantity.toString(), style: TextStyle(fontSize: 15))),
              ]
            )).toList() : []
        ),
      ),


      SizedBox( height: 10 ),
        Center(  
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color.fromRGBO(118, 35, 109, 1),
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text(
                  'Guardar orden',
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