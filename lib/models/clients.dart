import 'package:productos_app/models/models.dart';

class Client {
  String? id;
  String name;
  String lastname;
  String? address;
  double balance;
  String phone;
  String status;
  List<Product>? products;
  List<Payment>? payments;
  List<Order>? orders;
  
  Client({
    this.id,
    required this.name,
    required this.lastname,
    this.address,
    required this.balance,
    required this.phone,
    required this.status,
    this.products,
    this.payments,
    this.orders
  });

   factory Client.fromJson(dynamic json) {
   final productList = json['products'] as List;
   List<Product> products =
       productList.map((i) => Product.fromJson(i)).toList();
   final paymentList = json['payments'] as List;
   List<Payment> payments =
       paymentList.map((i) => Payment.fromJson(i)).toList();
   final orderList =  json['orders'] as List;
   List<Order> orders =  
      orderList.map((i) => Order.fromJson(i)).toList();

   return Client(
     id: json['id'] as String,
     name: json['name'] as String,
     lastname: json['lastname'] as String,
     address: json['address'],
     balance: json['balance'].toDouble(),
     phone: json['phone'],
     status: json['status'],
     products: products,
     payments: payments,
     orders: orders,
   );
 }
  
  Map<String, dynamic> toMap() => {
    "name": name,
    "lastname": lastname,
    "balance": balance,
    "address": address,
    "phone": phone,
    "status": status,
    'products': products?.map((product) => product.toMap()).toList(growable: false),
    'payment': payments?.map((payment) => payment.toMap()).toList(growable: false),
    'orders': orders?.map((order) => order.toMap()).toList(growable: false),
  };

   static Client fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'],
      name: map['name'],
      lastname: map['lastname'],
      balance: map['balance'].toDouble(),
      address: map['address'],
      phone: map['phone'].toString(),
      status: map['status'],
      products: map.containsKey('products') ? productList(map['products']) : null,
      payments: map.containsKey('payments') ? paymentList(map['payments']) : null,
      orders: map.containsKey('orders') ? orderList(map['orders']) : null
    );
 }

 static List<Product> productList(Map<String, dynamic> map) {
    final List<Product> products = [];
    map.forEach((key, value) {
      final tempClient = Product.fromMap( value );
      tempClient.id = key;
      products.add( tempClient );
    });
   return products;
 }

  static List<Payment> paymentList(Map<String, dynamic> map) {
    final List<Payment> payments = [];
    map.forEach((key, value) {
      final tempClient = Payment.fromMap( value );
      tempClient.id = key;
      payments.add( tempClient );
    });
   return payments;
 }

 static List<Order> orderList(Map<String, dynamic> map) {
    final List<Order> orders = [];
    map.forEach((key, value) {
      final tempClient = Order.fromMap( value );
      tempClient.id = key;
      orders.add( tempClient );
    });
   return orders;
 }

  Client copy() => Client(
    id: this.id,
    name: this.name,
    lastname: this.lastname,
    balance: this.balance,
    address: this.address,
    phone: this.phone,
    status: this.status,
    products: this.products,
    payments: this.payments,
  );
    
}
