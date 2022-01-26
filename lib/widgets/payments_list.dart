import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class PaymentsList extends StatelessWidget {

  final List<Payment>? payments;
  const PaymentsList({Key? key, this.payments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: this.payments == null ? Container(
          child: Text('No hay elemtos para mostrar')
        ) : ListView(
          children: [ 
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
              child: Container(
                child: DataTable( 
                showCheckboxColumn: false,
                columns: [
                  DataColumn(label: Text('Fecha')),
                  DataColumn(label: Text('Monto')),
                  DataColumn(label: Text('Balance')),
                ],
                rows: this.payments == null ? const <DataRow>[] :
                  this.payments!.map<DataRow>((e) => DataRow(
                    onSelectChanged: (b) {
                      print('Selected');
                      _onselected(b, e);
                    },
                    cells: [
                      DataCell(Text(e.paymentDate)),
                      DataCell(Text('\$' + e.amountPayment.toStringAsFixed(2))),
                      DataCell(Text('\$' + e.balance.toStringAsFixed(2))),
                    ]
                  )).toList()
                      ),
              ),
            )]
        ),
      );
  }

  void _onselected(bool? b, Payment e) {}
}
