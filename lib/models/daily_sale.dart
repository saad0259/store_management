class DailySale {
  final String uid;
  final int serialNumber;
  final DateTime date;
  final String customerId;
  final String productId;
  final int quantity;
  final double pricePerItem;
  final double subTotal;
  final double marketFee;
  final double total;
  final bool isSynced;
  final DateTime createdAt;
  final DateTime? deletedAt;

  DailySale({
    required this.uid,
    required this.serialNumber,
    required this.date,
    required this.customerId,
    required this.productId,
    required this.quantity,
    required this.pricePerItem,
    required this.subTotal,
    required this.marketFee,
    required this.total,
    required this.isSynced,
    required this.createdAt,
    required this.deletedAt,
  });

  factory DailySale.fromJson(String uid, Map<String, dynamic> json) =>
      DailySale(
        uid: uid,
        serialNumber: json["serialNumber"] ?? '',
        date: DateTime.parse(json["date"] ?? DateTime.now()),
        customerId: json["customer"] ?? '',
        productId: json["product"] ?? '',
        quantity: json["quantity"] ?? 0,
        pricePerItem: json["pricePerItem"] ?? 0,
        subTotal: json["subtotal"] ?? 0,
        marketFee: json["marketFee"] ?? 0,
        total: json["total"] ?? 0,
        isSynced: json["isSynced"] ?? false,
        createdAt: json['createdAt'],
        deletedAt: json['deletedAt'],
      );

  Map<String, dynamic> toJson() => {
        "serialNumber": serialNumber,
        "date": date.toIso8601String(),
        "customer": customerId,
        "product": productId,
        "quantity": quantity,
        "pricePerItem": pricePerItem,
        "subtotal": subTotal,
        "marketFee": marketFee,
        "total": total,
        "isSynced": isSynced,
        'createdAt': createdAt,
        'deletedAt': deletedAt,
      };
}
