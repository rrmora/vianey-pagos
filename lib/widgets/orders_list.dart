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
      child: widget.orders == null ? Container(
        child: Center(
          child: Text('No hay informacion para mostrar')
        ),
      ) : Container(
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
              title: Text('Fecha del pedido: ' + item.orderDate),
            );
          },
          body: Stack(
            children: [
              ListTile(
                title: Text('Estatus: ' + item.orderStatus, style: TextStyle( color: Colors.black87, fontSize: 18 )),
                subtitle:
                    Text('Comentario: ' + item.comment, style: TextStyle( color: Colors.black38, fontSize: 16)),
                trailing: const Icon(Icons.edit, size: 35),
                onTap: () {
                  setState(() {
                    print(item);
                  });
              }),
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
