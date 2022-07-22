class Product {
  String uid;
  int serialNumber;
  String name;
  bool isSynced;
  DateTime createdAt;
  DateTime? deletedAt;

  Product({
    required this.uid,
    required this.serialNumber,
    required this.name,
    this.isSynced = false,
    required this.createdAt,
    required this.deletedAt,
  });

  factory Product.fromJson(String uid, Map<String, dynamic> json) => Product(
        uid: uid,
        serialNumber: json["serialNumber"] ?? 0,
        name: json["name"] ?? '',
        isSynced: json["isSynced"] ?? false,
        createdAt: json['createdAt'],
        deletedAt: json['deletedAt'],
      );

  Map<String, dynamic> toJson() => {
        "serialNumber": serialNumber,
        "name": name,
        "isSynced": isSynced,
        'createdAt': createdAt,
        'deletedAt': deletedAt,
      };
}
