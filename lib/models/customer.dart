class Customer {
  String uid;
  int serialNumber;
  String name;
  bool isSynced;
  DateTime createdAt;
  DateTime? deletedAt;

  Customer({
    required this.uid,
    required this.serialNumber,
    required this.name,
    this.isSynced = false,
    required this.createdAt,
    required this.deletedAt,
  });

  factory Customer.fromJson(String uid, Map<String, dynamic> json) => Customer(
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
