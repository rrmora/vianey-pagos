import 'dart:convert';

import 'package:productos_app/models/models.dart';

class Order {
    Order({
        this.id,
        required this.orderDate,
        required this.orderStatus,
        required this.total,
        required this.comment,
        required this.isExpanded,
        required this.products
    });

    String? id;
    String orderDate;
    String orderStatus;
    double total;
    String comment;
    bool isExpanded = false;
    List<Product> products;

    factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Order.fromMap(Map<String, dynamic> json) => Order(
        orderDate: json["order_date"],
        orderStatus: json["order_status"],
        total: json["total"].toDouble(),
        comment: json["comment"],
        isExpanded: false,
        products: productList(json["products"])
    );

    static List<Product> productList(Map<String, dynamic> map) {
      final List<Product> products = [];
      map.forEach((key, value) {
        final tempClient = Product.fromMap( value );
        tempClient.id = key;
        products.add( tempClient );
      });
    return products;
 }

    Map<String, dynamic> toMap() => {
        "orderDate": orderDate,
        "orderStatus": orderStatus,
        "comment": comment,
        "total": total,
        'products': products.map((product) => product.toMap()).toList(growable: false),
    };

    Order copy() => Order(
      id: this.id,
      orderDate: orderDate,
      orderStatus: orderStatus,
      total: total,
      comment: comment,
      isExpanded: false,
      products: this.products
    );

}