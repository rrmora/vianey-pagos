
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClientsService extends ChangeNotifier {
  final storage = new FlutterSecureStorage();
  
  final String _baseUrl = 'pagos-vianey-default-rtdb.firebaseio.com';
  final List<Client> clients = [];
  late Client selectedClient;

   bool isLoading = true;

  ClientsService() {
    this.loadClients();
  }

  Future<List<Client>> loadClients() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https( _baseUrl, 'clients.json', {
      'auth': await storage.read(key: 'token') ?? ''
    });
    final resp = await http.get( url );

    final Map<String, dynamic> clientsMap = json.decode( resp.body );

    clientsMap.forEach((key, value) {
      final tempClient = Client.fromMap( value );
      tempClient.id = key;
      this.clients.add( tempClient );
    });


    this.isLoading = false;
    notifyListeners();

    return this.clients;
  }
}