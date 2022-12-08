// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.category,
    required this.id,
    required this.location,
    required this.price,
    required this.productImage,
    required this.productName,
    required this.quantity,
    required this.rating,
  });

  String category;
  String id;
  String location;
  Map price;
  String productImage;
  String productName;
  String quantity;
  String rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        category: json["category"],
        id: json["id"],
        location: json["location"],
        price: json['price'],
        productImage: json["productImage"],
        productName: json["productName"],
        quantity: json["quantity"].toString(),
        rating: json["rating"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "id": id,
        "location": location,
        "price": price,
        "productImage": productImage,
        "productName": productName,
        "quantity": quantity,
        "rating": rating,
      };
}
