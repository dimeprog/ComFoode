// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'item.dart';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    required this.id,
    required this.userId,
    required this.orderId,
    required this.total,
    required this.status,
    required this.items,
    required this.v,
  });

  String? id;
  String? userId;
  String? orderId;
  int? total;
  String? status;
  List<Item>? items;
  int? v;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        userId: json["userId"],
        orderId: json["orderId"],
        total: json["total"],
        status: json["status"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "orderId": orderId,
        "total": total,
        "status": status,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "__v": v,
      };
}
