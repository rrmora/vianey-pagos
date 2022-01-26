import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductsList extends StatelessWidget {

  final List<Product> products;
  const ProductsList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: DataTable( 
          showCheckboxColumn: false,
          columns: [
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Cantidad')),
            DataColumn(label: Text('Total')),
          ],
          rows:
            this.products.map<DataRow>((e) => DataRow(
              onSelectChanged: (b) {
                print('Selected');
                _onselected(b, e);
              },
              cells: [
                DataCell(Text(e.productName)),
                DataCell(Text(e.quantity.toString())),
                DataCell(Text('\$' + e.price.toStringAsFixed(2))),
              ]
            )).toList()
        ),
      );
  }

  void _onselected(bool? b, Product e) {
    print('Selected');
  }
}