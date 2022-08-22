import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductsList extends StatelessWidget {

  final List<Product> products;
  const ProductsList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _productList();
  }

  _productList() {
    return products.isEmpty ? CardNoProducts() :
     Container(
        width: double.infinity,
        child: DataTable( 
          showCheckboxColumn: false,
          columnSpacing: 30.0,
          columns: [
            DataColumn(label: Text('Nombre', style: TextStyle(fontSize: 17))),
            DataColumn(label: Text('Cantidad', style: TextStyle(fontSize: 17))),
            DataColumn(label: Text('Total', style: TextStyle(fontSize: 17))),
          ],
          rows:
            this.products.map<DataRow>((e) => DataRow(
              onSelectChanged: (b) {
                print('Selected');
              },
              cells: [
                DataCell(Text(e.productName.toString(), style: TextStyle(fontSize: 15))),
                DataCell(Text(e.quantity.toString(), style: TextStyle(fontSize: 15))),
                DataCell(Text(e.quantity.toString(), style: TextStyle(fontSize: 15))),
              ]
            )).toList()
        ),
      );
  }

}