import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/widgets/widgets.dart';

class PaymentsList extends StatelessWidget {

  final List<Payment>? payments;
  const PaymentsList({Key? key, this.payments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: this.payments == null ? CardNoProducts() : _paymentListTable(),
      );
  }
  
  _paymentListTable() {
    return ListView(
          children: [ 
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                child: Container(
                  child: DataTable( 
                  showCheckboxColumn: false,
                  columns: [
                    DataColumn(label: Text('Fecha', style: TextStyle(fontSize: 18))),
                    DataColumn(label: Text('Monto', style: TextStyle(fontSize: 18))),
                    DataColumn(label: Text('Balance', style: TextStyle(fontSize: 18))),
                  ],
                  rows: this.payments == null ? const <DataRow>[] :
                    this.payments!.map<DataRow>((e) => DataRow(
                      onSelectChanged: (b) {
                        print('Selected');
                      },
                      cells: [
                        DataCell(Text(e.paymentDate, style: TextStyle(fontSize: 16))),
                        DataCell(Text('\$' + e.amountPayment.toStringAsFixed(2), style: TextStyle(fontSize: 16))),
                        DataCell(Text('\$' + e.balance.toStringAsFixed(2), style: TextStyle(fontSize: 16))),
                      ]
                    )).toList()
                  ),
                ),
              )
          ]
        );
  }
}
