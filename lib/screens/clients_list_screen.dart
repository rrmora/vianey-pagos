import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/clients_service.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ClientListScreen extends StatefulWidget {

  @override
  _ClientListScreenState createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {

  Icon customIcon = Icon(Icons.search);
  Widget customText = Text('Clientes');
  List<Client> clientsList = [];
  List<Client> auxClients = [];
  int cont = 0;

    @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    final clientsService = Provider.of<ClientsService>(context);
    
    if( clientsService.isLoading ) return LoadingScreen();
    this.clientsList = clientsService.clients;
    if (cont == 0) {
     this.auxClients = clientsList;
    }
    cont++; 

    return Scaffold(
      appBar: AppBar(
        leading: IconButton (
          icon: Icon(Icons.arrow_back), 
          onPressed: () { 
            Navigator.popAndPushNamed(context, 'dashboard');
          },
        ),
        actions: [
          IconButton(
          icon:  customIcon,
          onPressed: () {
            setState(() {
              if (this.customIcon.icon == Icons.search) {
                this.customIcon = Icon(Icons.cancel);
                this.customText = TextField(
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Buscar, Nombre o Celular'
                  ),
                  style: TextStyle( color: Colors.white, fontSize: 18),
                  onChanged: ( value ) async => {
                    await Future.delayed(Duration(seconds: 1)),
                    _findClient(value)
                  }
                );
              } else {
                this.customIcon = Icon(Icons.search);
                this.customText = Text('Clientes');
                setState(() {
                  this.auxClients = this.clientsList;
                });
              }
            });
          }),
        ],
        title: customText
      ),
      body: this.auxClients.isEmpty ? CardNoProducts() :
      _clientListTable(context, this.auxClients),
      floatingActionButton: _floatingActionButton(context),
   );
  }

  _clientListTable(context, clientsService) {
    return ListView(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
            child: Container(
              width: double.infinity,
              child: DataTable( 
                showCheckboxColumn: false,
                columnSpacing: 30.0,
                columns: [
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('Nombre', style: TextStyle(fontSize: 17))),
                  DataColumn(label: Text('Telefono', style: TextStyle(fontSize: 17))),
                  DataColumn(label: Text('Saldo', style: TextStyle(fontSize: 17))),
                ],
                rows:
                  this.auxClients.map<DataRow>((e) => DataRow(
                    onSelectChanged: (b) {
                      Navigator.pushNamed(context, 'clientDetail', arguments: e);
                    },
                    cells: [
                      DataCell(Icon(Icons.edit, color: Colors.grey, size: 27), onTap: () => {Navigator.pushNamed(context, 'client')},),
                      DataCell(Text(e.name + ' ' + e.lastname, style: TextStyle(fontSize: 15))),
                      DataCell(Text(e.phone.toString(), style: TextStyle(fontSize: 15))),
                      DataCell(Text('\$' + e.balance.toStringAsFixed(2), style: TextStyle(fontSize: 15))),
                    ]
                  )).toList()
              ),
            ),
          ),
        ],
      );
  }

  _floatingActionButton(context) {
    return FloatingActionButton(
      onPressed: () => Navigator.popAndPushNamed(context, 'client'),
      tooltip: 'Increment',
      child: Icon(Icons.add)
    );
  }

  _findClient(String value) {
    setState(() {
      this.auxClients = this.clientsList.where((client) => 
      client.name.toLowerCase().contains(value.toLowerCase()) || 
      client.lastname.toLowerCase().contains(value.toLowerCase()) || 
      client.phone.toLowerCase().contains(value.toLowerCase())
      ).toList();
      debugPrint(this.auxClients.length.toString());
    });
  }

}