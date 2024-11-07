import 'dart:convert';

class Product {
  final String title;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'price': price,
    'quantity': quantity,
    'imageUrl': imageUrl,
  };

  String toJsonString() => jsonEncode(toJson());
}
