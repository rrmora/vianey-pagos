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
        // actions: [IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.popAndPushNamed(context, 'clientsList');
        //   })],
      ),
      body: _pageViewWidget(client),
      floatingActionButton: _floatingActionButton(client),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  _pageViewWidget(client) {
    return PageView(
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
      );
  }

  _floatingActionButton(client) {
    return Visibility(
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
      );
  }

  _bottomNavigation() {
    return BottomNavigationBar(
        backgroundColor: Color.fromRGBO(118, 35, 109, 1),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_outlined, size: 28),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.price_check_outlined, size: 28),
            label: 'Pagos'
          )
        ],
        onTap: (index) {
          _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
        }
      );
  }
}