import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class PaymentDetailScreen extends StatelessWidget {

  const PaymentDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = ModalRoute.of(context)!.settings.arguments as Client;
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Pago'),
        // actions: [IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.popAndPushNamed(context, 'clientDetail', arguments: client);
        //   })],
      )
    );
  }
}