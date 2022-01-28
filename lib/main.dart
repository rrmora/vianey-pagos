import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

 
void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
        ChangeNotifierProvider(create: ( _ ) => ProductsService() ),
        ChangeNotifierProvider(create: ( _ ) => ClientsService() )
      ],
      child: MyApp(),
    );
  }
}



 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      routes: {
        'checkAuth'   : ( _ ) => CheckAuthScreen(),
        'dashboard'   : ( _ ) => DashboardScreen(),
        'home'    : ( _ ) => HomeScreen(),
        'login'   : ( _ ) => LoginScreen(),
        'client'   : ( _ ) => ClientScreen(),
        'clientsList' : ( _ ) => ClientListScreen(),
        'clientDetail' : ( _ ) => ClientDetailScreen(),
        'orderDetail' : ( _ ) => OrderDetailScreen(),
        'paymentDetail' : ( _ ) => PaymentDetailScreen(),
        'product' : ( _ ) => ProductScreen(),
        'register'   : ( _ ) => RegisterScreen(),
      },
      scaffoldMessengerKey: NotificationService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Color.fromRGBO(118, 35, 109, 1)
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(118, 35, 109, 1),
          elevation: 0
        )
      ),
    );
  }
}