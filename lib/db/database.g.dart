// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Customer extends DataClass implements Insertable<Customer> {
  final String uid;
  final int serialNumber;
  final String name;
  final bool isSynced;
  final String createdAt;
  final String? deletedAt;
  Customer(
      {required this.uid,
      required this.serialNumber,
      required this.name,
      required this.isSynced,
      required this.createdAt,
      this.deletedAt});
  factory Customer.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Customer(
      uid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uid'])!,
      serialNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}serial_number'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      isSynced: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_synced'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      deletedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['serial_number'] = Variable<int>(serialNumber);
    map['name'] = Variable<String>(name);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<String>(createdAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<String?>(deletedAt);
    }
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      uid: Value(uid),
      serialNumber: Value(serialNumber),
      name: Value(name),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      uid: serializer.fromJson<String>(json['uid']),
      serialNumber: serializer.fromJson<int>(json['serialNumber']),
      name: serializer.fromJson<String>(json['name']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      deletedAt: serializer.fromJson<String?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'serialNumber': serializer.toJson<int>(serialNumber),
      'name': serializer.toJson<String>(name),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<String>(createdAt),
      'deletedAt': serializer.toJson<String?>(deletedAt),
    };
  }

  Customer copyWith(
          {String? uid,
          int? serialNumber,
          String? name,
          bool? isSynced,
          String? createdAt,
          String? deletedAt}) =>
      Customer(
        uid: uid ?? this.uid,
        serialNumber: serialNumber ?? this.serialNumber,
        name: name ?? this.name,
        isSynced: isSynced ?? this.isSynced,
        createdAt: createdAt ?? this.createdAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('uid: $uid, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('name: $name, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uid, serialNumber, name, isSynced, createdAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.uid == this.uid &&
          other.serialNumber == this.serialNumber &&
          other.name == this.name &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt &&
          other.deletedAt == this.deletedAt);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<String> uid;
  final Value<int> serialNumber;
  final Value<String> name;
  final Value<bool> isSynced;
  final Value<String> createdAt;
  final Value<String?> deletedAt;
  const CustomersCompanion({
    this.uid = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.name = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  CustomersCompanion.insert({
    required String uid,
    this.serialNumber = const Value.absent(),
    required String name,
    this.isSynced = const Value.absent(),
    required String createdAt,
    this.deletedAt = const Value.absent(),
  })  : uid = Value(uid),
        name = Value(name),
        createdAt = Value(createdAt);
  static Insertable<Customer> custom({
    Expression<String>? uid,
    Expression<int>? serialNumber,
    Expression<String>? name,
    Expression<bool>? isSynced,
    Expression<String>? createdAt,
    Expression<String?>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (name != null) 'name': name,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  CustomersCompanion copyWith(
      {Value<String>? uid,
      Value<int>? serialNumber,
      Value<String>? name,
      Value<bool>? isSynced,
      Value<String>? createdAt,
      Value<String?>? deletedAt}) {
    return CustomersCompanion(
      uid: uid ?? this.uid,
      serialNumber: serialNumber ?? this.serialNumber,
      name: name ?? this.name,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<int>(serialNumber.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<String?>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('uid: $uid, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('name: $name, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String?> uid = GeneratedColumn<String?>(
      'uid', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _serialNumberMeta =
      const VerificationMeta('serialNumber');
  @override
  late final GeneratedColumn<int?> serialNumber = GeneratedColumn<int?>(
      'serial_number', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isSyncedMeta = const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool?> isSynced = GeneratedColumn<bool?>(
      'is_synced', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_synced IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<String?> deletedAt = GeneratedColumn<String?>(
      'deleted_at', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [uid, serialNumber, name, isSynced, createdAt, deletedAt];
  @override
  String get aliasedName => _alias ?? 'customers';
  @override
  String get actualTableName => 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<Customer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('serial_number')) {
      context.handle(
          _serialNumberMeta,
          serialNumber.isAcceptableOrUnknown(
              data['serial_number']!, _serialNumberMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {serialNumber};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Customer.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String uid;
  final int serialNumber;
  final String name;
  final bool isSynced;
  final String createdAt;
  final String? deletedAt;
  Product(
      {required this.uid,
      required this.serialNumber,
      required this.name,
      required this.isSynced,
      required this.createdAt,
      this.deletedAt});
  factory Product.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Product(
      uid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uid'])!,
      serialNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}serial_number'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      isSynced: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_synced'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      deletedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['serial_number'] = Variable<int>(serialNumber);
    map['name'] = Variable<String>(name);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<String>(createdAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<String?>(deletedAt);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      uid: Value(uid),
      serialNumber: Value(serialNumber),
      name: Value(name),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      uid: serializer.fromJson<String>(json['uid']),
      serialNumber: serializer.fromJson<int>(json['serialNumber']),
      name: serializer.fromJson<String>(json['name']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      deletedAt: serializer.fromJson<String?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'serialNumber': serializer.toJson<int>(serialNumber),
      'name': serializer.toJson<String>(name),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<String>(createdAt),
      'deletedAt': serializer.toJson<String?>(deletedAt),
    };
  }

  Product copyWith(
          {String? uid,
          int? serialNumber,
          String? name,
          bool? isSynced,
          String? createdAt,
          String? deletedAt}) =>
      Product(
        uid: uid ?? this.uid,
        serialNumber: serialNumber ?? this.serialNumber,
        name: name ?? this.name,
        isSynced: isSynced ?? this.isSynced,
        createdAt: createdAt ?? this.createdAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('uid: $uid, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('name: $name, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uid, serialNumber, name, isSynced, createdAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.uid == this.uid &&
          other.serialNumber == this.serialNumber &&
          other.name == this.name &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt &&
          other.deletedAt == this.deletedAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> uid;
  final Value<int> serialNumber;
  final Value<String> name;
  final Value<bool> isSynced;
  final Value<String> createdAt;
  final Value<String?> deletedAt;
  const ProductsCompanion({
    this.uid = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.name = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String uid,
    this.serialNumber = const Value.absent(),
    required String name,
    this.isSynced = const Value.absent(),
    required String createdAt,
    this.deletedAt = const Value.absent(),
  })  : uid = Value(uid),
        name = Value(name),
        createdAt = Value(createdAt);
  static Insertable<Product> custom({
    Expression<String>? uid,
    Expression<int>? serialNumber,
    Expression<String>? name,
    Expression<bool>? isSynced,
    Expression<String>? createdAt,
    Expression<String?>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (name != null) 'name': name,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  ProductsCompanion copyWith(
      {Value<String>? uid,
      Value<int>? serialNumber,
      Value<String>? name,
      Value<bool>? isSynced,
      Value<String>? createdAt,
      Value<String?>? deletedAt}) {
    return ProductsCompanion(
      uid: uid ?? this.uid,
      serialNumber: serialNumber ?? this.serialNumber,
      name: name ?? this.name,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<int>(serialNumber.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<String?>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('uid: $uid, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('name: $name, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String?> uid = GeneratedColumn<String?>(
      'uid', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _serialNumberMeta =
      const VerificationMeta('serialNumber');
  @override
  late final GeneratedColumn<int?> serialNumber = GeneratedColumn<int?>(
      'serial_number', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isSyncedMeta = const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool?> isSynced = GeneratedColumn<bool?>(
      'is_synced', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_synced IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<String?> deletedAt = GeneratedColumn<String?>(
      'deleted_at', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [uid, serialNumber, name, isSynced, createdAt, deletedAt];
  @override
  String get aliasedName => _alias ?? 'products';
  @override
  String get actualTableName => 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('serial_number')) {
      context.handle(
          _serialNumberMeta,
          serialNumber.isAcceptableOrUnknown(
              data['serial_number']!, _serialNumberMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {serialNumber};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Product.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class DailySale extends DataClass implements Insertable<DailySale> {
  final String uid;
  final int serialNumber;
  final String date;
  final String customerId;
  final String productId;
  final int quantity;
  final double pricePerItem;
  final double subTotal;
  final double marketFee;
  final double total;
  final bool isSynced;
  final String createdAt;
  final String? deletedAt;
  DailySale(
      {required this.uid,
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
      this.deletedAt});
  factory DailySale.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DailySale(
      uid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uid'])!,
      serialNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}serial_number'])!,
      date: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      customerId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}customer_id'])!,
      productId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id'])!,
      quantity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
      pricePerItem: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price_per_item'])!,
      subTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sub_total'])!,
      marketFee: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}market_fee'])!,
      total: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total'])!,
      isSynced: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_synced'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      deletedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['serial_number'] = Variable<int>(serialNumber);
    map['date'] = Variable<String>(date);
    map['customer_id'] = Variable<String>(customerId);
    map['product_id'] = Variable<String>(productId);
    map['quantity'] = Variable<int>(quantity);
    map['price_per_item'] = Variable<double>(pricePerItem);
    map['sub_total'] = Variable<double>(subTotal);
    map['market_fee'] = Variable<double>(marketFee);
    map['total'] = Variable<double>(total);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<String>(createdAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<String?>(deletedAt);
    }
    return map;
  }

  DailySalesCompanion toCompanion(bool nullToAbsent) {
    return DailySalesCompanion(
      uid: Value(uid),
      serialNumber: Value(serialNumber),
      date: Value(date),
      customerId: Value(customerId),
      productId: Value(productId),
      quantity: Value(quantity),
      pricePerItem: Value(pricePerItem),
      subTotal: Value(subTotal),
      marketFee: Value(marketFee),
      total: Value(total),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DailySale.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailySale(
      uid: serializer.fromJson<String>(json['uid']),
      serialNumber: serializer.fromJson<int>(json['serialNumber']),
      date: serializer.fromJson<String>(json['date']),
      customerId: serializer.fromJson<String>(json['customerId']),
      productId: serializer.fromJson<String>(json['productId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      pricePerItem: serializer.fromJson<double>(json['pricePerItem']),
      subTotal: serializer.fromJson<double>(json['subTotal']),
      marketFee: serializer.fromJson<double>(json['marketFee']),
      total: serializer.fromJson<double>(json['total']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      deletedAt: serializer.fromJson<String?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'serialNumber': serializer.toJson<int>(serialNumber),
      'date': serializer.toJson<String>(date),
      'customerId': serializer.toJson<String>(customerId),
      'productId': serializer.toJson<String>(productId),
      'quantity': serializer.toJson<int>(quantity),
      'pricePerItem': serializer.toJson<double>(pricePerItem),
      'subTotal': serializer.toJson<double>(subTotal),
      'marketFee': serializer.toJson<double>(marketFee),
      'total': serializer.toJson<double>(total),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<String>(createdAt),
      'deletedAt': serializer.toJson<String?>(deletedAt),
    };
  }

  DailySale copyWith(
          {String? uid,
          int? serialNumber,
          String? date,
          String? customerId,
          String? productId,
          int? quantity,
          double? pricePerItem,
          double? subTotal,
          double? marketFee,
          double? total,
          bool? isSynced,
          String? createdAt,
          String? deletedAt}) =>
      DailySale(
        uid: uid ?? this.uid,
        serialNumber: serialNumber ?? this.serialNumber,
        date: date ?? this.date,
        customerId: customerId ?? this.customerId,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        pricePerItem: pricePerItem ?? this.pricePerItem,
        subTotal: subTotal ?? this.subTotal,
        marketFee: marketFee ?? this.marketFee,
        total: total ?? this.total,
        isSynced: isSynced ?? this.isSynced,
        createdAt: createdAt ?? this.createdAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DailySale(')
          ..write('uid: $uid, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('date: $date, ')
          ..write('customerId: $customerId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('pricePerItem: $pricePerItem, ')
          ..write('subTotal: $subTotal, ')
          ..write('marketFee: $marketFee, ')
          ..write('total: $total, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uid,
      serialNumber,
      date,
      customerId,
      productId,
      quantity,
      pricePerItem,
      subTotal,
      marketFee,
      total,
      isSynced,
      createdAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailySale &&
          other.uid == this.uid &&
          other.serialNumber == this.serialNumber &&
          other.date == this.date &&
          other.customerId == this.customerId &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.pricePerItem == this.pricePerItem &&
          other.subTotal == this.subTotal &&
          other.marketFee == this.marketFee &&
          other.total == this.total &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt &&
          other.deletedAt == this.deletedAt);
}

class DailySalesCompanion extends UpdateCompanion<DailySale> {
  final Value<String> uid;
  final Value<int> serialNumber;
  final Value<String> date;
  final Value<String> customerId;
  final Value<String> productId;
  final Value<int> quantity;
  final Value<double> pricePerItem;
  final Value<double> subTotal;
  final Value<double> marketFee;
  final Value<double> total;
  final Value<bool> isSynced;
  final Value<String> createdAt;
  final Value<String?> deletedAt;
  const DailySalesCompanion({
    this.uid = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.date = const Value.absent(),
    this.customerId = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.pricePerItem = const Value.absent(),
    this.subTotal = const Value.absent(),
    this.marketFee = const Value.absent(),
    this.total = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  DailySalesCompanion.insert({
    required String uid,
    this.serialNumber = const Value.absent(),
    required String date,
    required String customerId,
    required String productId,
    required int quantity,
    required double pricePerItem,
    required double subTotal,
    required double marketFee,
    required double total,
    this.isSynced = const Value.absent(),
    required String createdAt,
    this.deletedAt = const Value.absent(),
  })  : uid = Value(uid),
        date = Value(date),
        customerId = Value(customerId),
        productId = Value(productId),
        quantity = Value(quantity),
        pricePerItem = Value(pricePerItem),
        subTotal = Value(subTotal),
        marketFee = Value(marketFee),
        total = Value(total),
        createdAt = Value(createdAt);
  static Insertable<DailySale> custom({
    Expression<String>? uid,
    Expression<int>? serialNumber,
    Expression<String>? date,
    Expression<String>? customerId,
    Expression<String>? productId,
    Expression<int>? quantity,
    Expression<double>? pricePerItem,
    Expression<double>? subTotal,
    Expression<double>? marketFee,
    Expression<double>? total,
    Expression<bool>? isSynced,
    Expression<String>? createdAt,
    Expression<String?>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (date != null) 'date': date,
      if (customerId != null) 'customer_id': customerId,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (pricePerItem != null) 'price_per_item': pricePerItem,
      if (subTotal != null) 'sub_total': subTotal,
      if (marketFee != null) 'market_fee': marketFee,
      if (total != null) 'total': total,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  DailySalesCompanion copyWith(
      {Value<String>? uid,
      Value<int>? serialNumber,
      Value<String>? date,
      Value<String>? customerId,
      Value<String>? productId,
      Value<int>? quantity,
      Value<double>? pricePerItem,
      Value<double>? subTotal,
      Value<double>? marketFee,
      Value<double>? total,
      Value<bool>? isSynced,
      Value<String>? createdAt,
      Value<String?>? deletedAt}) {
    return DailySalesCompanion(
      uid: uid ?? this.uid,
      serialNumber: serialNumber ?? this.serialNumber,
      date: date ?? this.date,
      customerId: customerId ?? this.customerId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      pricePerItem: pricePerItem ?? this.pricePerItem,
      subTotal: subTotal ?? this.subTotal,
      marketFee: marketFee ?? this.marketFee,
      total: total ?? this.total,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<int>(serialNumber.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (pricePerItem.present) {
      map['price_per_item'] = Variable<double>(pricePerItem.value);
    }
    if (subTotal.present) {
      map['sub_total'] = Variable<double>(subTotal.value);
    }
    if (marketFee.present) {
      map['market_fee'] = Variable<double>(marketFee.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<String?>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailySalesCompanion(')
          ..write('uid: $uid, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('date: $date, ')
          ..write('customerId: $customerId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('pricePerItem: $pricePerItem, ')
          ..write('subTotal: $subTotal, ')
          ..write('marketFee: $marketFee, ')
          ..write('total: $total, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $DailySalesTable extends DailySales
    with TableInfo<$DailySalesTable, DailySale> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailySalesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String?> uid = GeneratedColumn<String?>(
      'uid', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _serialNumberMeta =
      const VerificationMeta('serialNumber');
  @override
  late final GeneratedColumn<int?> serialNumber = GeneratedColumn<int?>(
      'serial_number', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String?> date = GeneratedColumn<String?>(
      'date', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _customerIdMeta = const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<String?> customerId = GeneratedColumn<String?>(
      'customer_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String?> productId = GeneratedColumn<String?>(
      'product_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int?> quantity = GeneratedColumn<int?>(
      'quantity', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _pricePerItemMeta =
      const VerificationMeta('pricePerItem');
  @override
  late final GeneratedColumn<double?> pricePerItem = GeneratedColumn<double?>(
      'price_per_item', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _subTotalMeta = const VerificationMeta('subTotal');
  @override
  late final GeneratedColumn<double?> subTotal = GeneratedColumn<double?>(
      'sub_total', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _marketFeeMeta = const VerificationMeta('marketFee');
  @override
  late final GeneratedColumn<double?> marketFee = GeneratedColumn<double?>(
      'market_fee', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double?> total = GeneratedColumn<double?>(
      'total', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _isSyncedMeta = const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool?> isSynced = GeneratedColumn<bool?>(
      'is_synced', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_synced IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<String?> deletedAt = GeneratedColumn<String?>(
      'deleted_at', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        uid,
        serialNumber,
        date,
        customerId,
        productId,
        quantity,
        pricePerItem,
        subTotal,
        marketFee,
        total,
        isSynced,
        createdAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? 'daily_sales';
  @override
  String get actualTableName => 'daily_sales';
  @override
  VerificationContext validateIntegrity(Insertable<DailySale> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('serial_number')) {
      context.handle(
          _serialNumberMeta,
          serialNumber.isAcceptableOrUnknown(
              data['serial_number']!, _serialNumberMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price_per_item')) {
      context.handle(
          _pricePerItemMeta,
          pricePerItem.isAcceptableOrUnknown(
              data['price_per_item']!, _pricePerItemMeta));
    } else if (isInserting) {
      context.missing(_pricePerItemMeta);
    }
    if (data.containsKey('sub_total')) {
      context.handle(_subTotalMeta,
          subTotal.isAcceptableOrUnknown(data['sub_total']!, _subTotalMeta));
    } else if (isInserting) {
      context.missing(_subTotalMeta);
    }
    if (data.containsKey('market_fee')) {
      context.handle(_marketFeeMeta,
          marketFee.isAcceptableOrUnknown(data['market_fee']!, _marketFeeMeta));
    } else if (isInserting) {
      context.missing(_marketFeeMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {serialNumber};
  @override
  DailySale map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DailySale.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DailySalesTable createAlias(String alias) {
    return $DailySalesTable(attachedDatabase, alias);
  }
}

abstract class _$MyAppDb extends GeneratedDatabase {
  _$MyAppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $DailySalesTable dailySales = $DailySalesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [customers, products, dailySales];
}
