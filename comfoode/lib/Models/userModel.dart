class User {
  String? id;
  String? name;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'] == null
          ? DateTime.now()
          : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null
          ? DateTime.now()
          : DateTime.parse(json['updated_at']));
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String()
      };
}
