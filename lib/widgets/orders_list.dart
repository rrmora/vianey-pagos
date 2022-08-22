import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/widgets/widgets.dart';

class OrdersList extends StatefulWidget {

  final Client client;
  OrdersList({Key? key, required this.client}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  final  ClientCustom clientCustom = new ClientCustom();
  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
      child: widget.client.orders?.length == 0 ? CardNoProducts() : _orderList(),
    );    
  }

  _orderList() {
    return Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    widget.client.orders![index].isExpanded = !isExpanded;
                  });
                },
              children: widget.client.orders!.map<ExpansionPanel>((Order item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Total: \$0.00', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    );
                  },
                  body: Stack(
                    children: [
                      ListTile(
                        title: Text('Fecha: ' + item.orderDate, style: TextStyle( color: Colors.black87, fontSize: 15, fontWeight: FontWeight.bold)),
                        subtitle:
                            Text('Comentario: ' + item.comment, style: TextStyle( color: Colors.black54, fontSize: 15)),
                        trailing: const Icon(Icons.edit, size: 30),
                        onTap: () {
                          setState(() {
                            print(item);
                            final res = widget.client;
                            clientCustom.client = res;
                            clientCustom.id = item.id;
                            Navigator.popAndPushNamed(context, 'orderDetail', arguments:  clientCustom);
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
