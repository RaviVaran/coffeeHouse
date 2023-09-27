import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuItemsRecord extends FirestoreRecord {
  MenuItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "specification" field.
  String? _specification;
  String get specification => _specification ?? '';
  bool hasSpecification() => _specification != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "on_sale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  bool hasOnSale() => _onSale != null;

  // "salePrice" field.
  double? _salePrice;
  double get salePrice => _salePrice ?? 0.0;
  bool hasSalePrice() => _salePrice != null;

  // "productImage" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "modifiers" field.
  List<String>? _modifiers;
  List<String> get modifiers => _modifiers ?? const [];
  bool hasModifiers() => _modifiers != null;

  // "modifiers2" field.
  List<String>? _modifiers2;
  List<String> get modifiers2 => _modifiers2 ?? const [];
  bool hasModifiers2() => _modifiers2 != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _specification = snapshotData['specification'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _onSale = snapshotData['on_sale'] as bool?;
    _salePrice = castToType<double>(snapshotData['salePrice']);
    _productImage = snapshotData['productImage'] as String?;
    _modifiers = getDataList(snapshotData['modifiers']);
    _modifiers2 = getDataList(snapshotData['modifiers2']);
    _price = castToType<int>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('menuItems');

  static Stream<MenuItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuItemsRecord.fromSnapshot(s));

  static Future<MenuItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuItemsRecord.fromSnapshot(s));

  static MenuItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MenuItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuItemsRecordData({
  String? name,
  String? description,
  int? quantity,
  String? specification,
  DateTime? createdAt,
  bool? onSale,
  double? salePrice,
  String? productImage,
  int? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'specification': specification,
      'created_at': createdAt,
      'on_sale': onSale,
      'salePrice': salePrice,
      'productImage': productImage,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuItemsRecordDocumentEquality implements Equality<MenuItemsRecord> {
  const MenuItemsRecordDocumentEquality();

  @override
  bool equals(MenuItemsRecord? e1, MenuItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.quantity == e2?.quantity &&
        e1?.specification == e2?.specification &&
        e1?.createdAt == e2?.createdAt &&
        e1?.onSale == e2?.onSale &&
        e1?.salePrice == e2?.salePrice &&
        e1?.productImage == e2?.productImage &&
        listEquality.equals(e1?.modifiers, e2?.modifiers) &&
        listEquality.equals(e1?.modifiers2, e2?.modifiers2) &&
        e1?.price == e2?.price;
  }

  @override
  int hash(MenuItemsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.quantity,
        e?.specification,
        e?.createdAt,
        e?.onSale,
        e?.salePrice,
        e?.productImage,
        e?.modifiers,
        e?.modifiers2,
        e?.price
      ]);

  @override
  bool isValidKey(Object? o) => o is MenuItemsRecord;
}
