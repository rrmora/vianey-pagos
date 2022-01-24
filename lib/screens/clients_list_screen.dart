import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/clients_service.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

class ClientListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);
    final clientsService = Provider.of<ClientsService>(context);
    
    if( clientsService.isLoading ) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de clientes'),
        actions: [IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            authService.logout();
            Navigator.popAndPushNamed(context, 'dashboard');
          })],
      ),
      body: Container(
        width: double.infinity,
        child: DataTable( 
          showCheckboxColumn: false,
          columns: [
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Telefono')),
            DataColumn(label: Text('Saldo')),
          ],
          rows:
            clientsService.clients.map<DataRow>((e) => DataRow(
              onSelectChanged: (b) {
                print('Selected');
                _onselected(b, e);
               // _onselected(b, e)
              },
              cells: [
                DataCell(Text(e.name + ' ' + e.lastname)),
                DataCell(Text(e.phone.toString())),
                DataCell(Text('\$' + e.balance.toStringAsFixed(2))),
              ]
            )).toList()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popAndPushNamed(context, 'ClientDetail'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
   );


  }

  void _onselected(bool? b, Client e) {
    print(e);
  }
}