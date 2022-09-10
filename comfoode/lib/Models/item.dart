class Item {
  Item({
    required this.productId,
    required this.quantity,
    required this.amount,
    required this.id,
  });

  String? productId;
  int? quantity;
  int? amount;
  String? id;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["productId"],
        quantity: json["quantity"],
        amount: json["amount"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "amount": amount,
        "_id": id,
      };
}
