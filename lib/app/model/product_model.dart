// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.location,
    required this.price,
    required this.id,
    required this.productName,
    required this.rating,
    required this.productImage,
    required this.category,
    required this.userName,
    required this.userProfileImage,
    required this.discription,
    required this.brand,
    required this.phone,
    required this.condition,
    required this.deposit,
    required this.userId,
    required this.isAvailable,
  });

  String category;
  String id;
  String location;
  String price;
  String productName;
  String rating;
  List productImage;
  String userName;
  String? userProfileImage;
  String discription;
  String brand;
  String condition;
  String phone;
  String deposit;
  String userId;
  bool isAvailable;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        category: json["category"],
        id: json["id"],
        location: json["location"] ?? '',
        price: json['price'],
        productImage: json["productImage"],
        productName: json["productName"],
        rating: json["rating"].toString(),
        condition: json["condition"] ?? '',
        brand: json["brand"] ?? '',
        discription: json["discription"] ?? '',
        userName: json["userName"] ?? "",
        userProfileImage: json["userProfileImage"] ?? '',
        phone: json["phone"] ?? '',
        deposit: json["deposit"] ?? '',
        userId: json["user_id"] ?? '',
        isAvailable: json["isAvailable"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "id": id,
        "location": location,
        "price": price,
        "productImage": productImage,
        "productName": productName,
        "rating": rating,
        "condition": condition,
        "brand": brand,
        "discription": discription,
        "userName": userName,
        "userProfileImage": userProfileImage,
        "phone": phone,
        "deposit": deposit,
        "user_id": userId,
        "isAvailable": isAvailable
      };
}
