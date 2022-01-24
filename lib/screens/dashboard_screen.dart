import 'package:flutter/material.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';


class DashboardScreen extends StatelessWidget {

  final WIDTH = 192.0;
  final HEIGHT = 48.0;

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [IconButton(
          icon: Icon(Icons.login_outlined),
          onPressed: () {
            authService.logout();
            Navigator.popAndPushNamed(context, 'login');
          })],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: WIDTH, height: HEIGHT, child: customButtonWidget()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popAndPushNamed(context, 'clientsList'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );    
  }

  Widget customButtonWidget() {
    List<Color> _colors = [Colors.deepOrange, Colors.yellow];
    List<double> _stops = [0.0, 0.7];
    return Stack(
      children: [
        // round box
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(WIDTH*0.19, 0, 0, 0),
          child: Container(
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    colors: _colors,
                    stops: _stops,
                  ),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(0.0),
                    topRight: const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0),
                    bottomLeft: const Radius.circular(0.0),
                  )),
              child: new Center(
                child: new Text("View",textScaleFactor: 2.0,),
              )),
        )
      ],
    );
  }
}