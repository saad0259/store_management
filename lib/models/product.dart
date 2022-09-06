import '../db/database.dart' as db show Product;

class Product {
  String uid;
  int serialNumber;
  String name;
  DateTime createdAt;
  DateTime? deletedAt;
  DateTime? syncedAt;

  Product({
    required this.uid,
    required this.serialNumber,
    required this.name,
    required this.createdAt,
    required this.deletedAt,
    required this.syncedAt,
  });

  factory Product.fromJson(String uid, Map<String, dynamic> json) => Product(
        uid: uid,
        serialNumber: json["serialNumber"] ?? 0,
        name: json["name"] ?? '',
        syncedAt: json["syncedAt"],
        createdAt: json['createdAt'],
        deletedAt: json['deletedAt'],
      );

  Map<String, dynamic> toJson() => {
        "serialNumber": serialNumber,
        "name": name,
        "syncedAt": syncedAt,
        'createdAt': createdAt,
        'deletedAt': deletedAt,
      };

  factory Product.fromDb(db.Product dbProduct) => Product(
        uid: dbProduct.uid,
        serialNumber: dbProduct.serialNumber,
        name: dbProduct.name,
        createdAt: DateTime.parse(dbProduct.createdAt),
        deletedAt: dbProduct.deletedAt == null
            ? null
            : DateTime.parse(dbProduct.deletedAt!),
        syncedAt: dbProduct.syncedAt == null
            ? null
            : DateTime.parse(dbProduct.syncedAt!),
      );
}
