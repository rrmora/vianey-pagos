import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/widgets/widgets.dart';

class ClientDetailScreen extends StatefulWidget {

  const ClientDetailScreen({Key? key}) : super(key: key);

  @override
  State<ClientDetailScreen> createState() => _ClientDetailScreenState();
}

class _ClientDetailScreenState extends State<ClientDetailScreen> {

  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final client = ModalRoute.of(context)!.settings.arguments as Client;
    return Scaffold(
      appBar: AppBar(
        title: Text(client.name + ' - Balance: \$' + client.balance.toStringAsFixed(2)),
        actions: [IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'clientsList');
          })],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          OrdersList(orders: client.orders == null ? null : client.orders),
          PaymentsList(payments: client.payments == null ? null : client.payments),
        ]
      ),
      floatingActionButton: Visibility(
        child: FloatingActionButton(
          onPressed: () => {
            if (_currentIndex == 0) {
              Navigator.popAndPushNamed(context, 'orderDetail', arguments:  client)
            } else {
              Navigator.popAndPushNamed(context, 'paymentDetail', arguments: client)
            }
          },
          child: Icon(Icons.add),
        ),
        visible: !(_currentIndex == 1 && client.orders == null)
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_outlined, size: 40, color: Colors.black87),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.price_check_outlined, size: 40, color: Colors.black87),
            label: 'Pagos'
          )
        ],
        onTap: (index) {
          _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
        }
      ),
    );
  }
}