class Customer {
  String id;
  int serialNumber;
  String name;

  Customer({
    required this.id,
    required this.serialNumber,
    required this.name,
  });

  factory Customer.fromJson(String uid, Map<String, dynamic> json) => Customer(
        id: uid,
        serialNumber: json["serialNumber"] ?? 0,
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "serialNumber": serialNumber,
        "name": name,
      };
}
