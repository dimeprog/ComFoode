// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.initialQuantity,
    this.soldQuantity,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  int? price;
  int? initialQuantity;
  int? soldQuantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        initialQuantity: json["initialQuantity"],
        soldQuantity: json["soldQuantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "initialQuantity": initialQuantity,
        "soldQuantity": soldQuantity,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
