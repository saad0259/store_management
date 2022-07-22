class Order {
  String id;
  String serialNumber;
  DateTime date;
  // Customer customer;
  // Supplier? suplier; //nullable becoz, they are not really using this one
  // Product product;
  int quantity;
  double pricePerItem;
  double marketFee;

  Order({
    required this.id,
    required this.serialNumber,
    required this.date,
    // this.customer,
    // this.suplier,
    // this.product,
    required this.quantity,
    required this.pricePerItem,
    required this.marketFee,
  });

  factory Order.fromJson(String uid, Map<String, dynamic> json) => Order(
        id: uid,
        serialNumber: json["serialNumber"] ?? '',
        date: DateTime.parse(json["date"] ?? DateTime.now()),
        // customer: Customer.fromJson(json["customer"] ?? {}),
        // suplier: Supplier.fromJson(json["suplier"] ?? {}),
        // product: Product.fromJson(json["product"] ?? {}),
        quantity: json["quantity"] ?? 0,
        pricePerItem: json["pricePerItem"] ?? 0,
        marketFee: json["marketFee"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "serialNumber": serialNumber,
        "date": date.toIso8601String(),
        // "customer": customer.toJson(),
        // "suplier": suplier.toJson(),
        // "product": product.toJson(),
        "quantity": quantity,
        "pricePerItem": pricePerItem,
        "marketFee": marketFee,
      };
}
