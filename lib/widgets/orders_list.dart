import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/widgets/widgets.dart';

class OrdersList extends StatefulWidget {

  final List<Order>? orders;
  OrdersList({Key? key, this.orders}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
      child: widget.orders == null ? CardNoProducts() : _orderList(),
    );    
  }

  _orderList() {
    return Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    widget.orders![index].isExpanded = !isExpanded;
                  });
                },
              children: widget.orders!.map<ExpansionPanel>((Order item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Fecha del pedido: ' + item.orderDate, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    );
                  },
                  body: Stack(
                    children: [
                      ListTile(
                        title: Text('Estatus: ' + item.orderStatus, style: TextStyle( color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold)),
                        subtitle:
                            Text('Comentario: ' + item.comment, style: TextStyle( color: Colors.black54, fontSize: 16)),
                        trailing: const Icon(Icons.edit, size: 35),
                        onTap: () {
                          setState(() {
                            print(item);
                          });
                        }
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50.0), 
                        child: ProductsList(products: item.products)
                      )
                    ] 
                  ),
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            )
          ),
        );
  }

}
