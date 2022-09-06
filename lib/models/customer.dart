import 'package:drift/drift.dart';

import '../db/database.dart' as db show Customer, CustomersCompanion;

class Customer {
  String uid;
  String name;
  int? serialNumber;
  DateTime createdAt;
  DateTime? deletedAt;
  DateTime? syncedAt;

  Customer({
    required this.uid,
    required this.name,
    required this.createdAt,
    this.serialNumber,
    this.syncedAt,
    this.deletedAt,
  });

  factory Customer.fromJson(String uid, Map<String, dynamic> json) => Customer(
        uid: uid,
        name: json["name"] ?? '',
        serialNumber: json["serialNumber"],
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

  factory Customer.fromDb(db.Customer dbCustomer) => Customer(
        uid: dbCustomer.uid,
        name: dbCustomer.name,
        serialNumber: dbCustomer.serialNumber,
        createdAt: DateTime.parse(dbCustomer.createdAt),
        deletedAt: dbCustomer.deletedAt == null
            ? null
            : DateTime.parse(dbCustomer.deletedAt!),
        syncedAt: dbCustomer.syncedAt == null
            ? null
            : DateTime.parse(dbCustomer.syncedAt!),
      );

  db.CustomersCompanion toDb() => db.CustomersCompanion(
        uid: Value(uid),
        name: Value(name),
        serialNumber:
            serialNumber == null ? const Value.absent() : Value(serialNumber!),
        createdAt: Value(createdAt.toIso8601String()),
        deletedAt: deletedAt == null
            ? const Value.absent()
            : Value(deletedAt!.toIso8601String()),
        syncedAt: syncedAt == null
            ? const Value.absent()
            : Value(syncedAt!.toIso8601String()),
      );
}
