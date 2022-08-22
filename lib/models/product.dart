import 'dart:convert';

class Product {
    Product({
        this.id,
        this.productName,
        this.price,
        this.quantity
    });

    String? id;
    String? productName;
    double? price;
    int? quantity;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        productName: json["product_name"],
        price: json["price"].toDouble(),
        quantity: json["quantity"].toInt(),
    );

    Map<String, dynamic> toMap() => {
        "productName": productName,
        "price": price,
        "quantity": quantity,
    };

    Product copy() => Product(
      productName: productName,
      price: price,
      quantity: quantity,
      id: this.id,
    );

}