import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "cart" field.
  CartItemStruct? _cart;
  CartItemStruct get cart => _cart ?? CartItemStruct();
  bool hasCart() => _cart != null;

  // "menuitemRef" field.
  DocumentReference? _menuitemRef;
  DocumentReference? get menuitemRef => _menuitemRef;
  bool hasMenuitemRef() => _menuitemRef != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _cart = CartItemStruct.maybeFromMap(snapshotData['cart']);
    _menuitemRef = snapshotData['menuitemRef'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _image = snapshotData['image'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('orders')
          : FirebaseFirestore.instance.collectionGroup('orders');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('orders').doc();

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DateTime? timestamp,
  String? status,
  CartItemStruct? cart,
  DocumentReference? menuitemRef,
  int? quantity,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'status': status,
      'cart': CartItemStruct().toMap(),
      'menuitemRef': menuitemRef,
      'quantity': quantity,
      'image': image,
    }.withoutNulls,
  );

  // Handle nested data for "cart" field.
  addCartItemStructData(firestoreData, cart, 'cart');

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.status == e2?.status &&
        e1?.cart == e2?.cart &&
        e1?.menuitemRef == e2?.menuitemRef &&
        e1?.quantity == e2?.quantity &&
        e1?.image == e2?.image;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.status,
        e?.cart,
        e?.menuitemRef,
        e?.quantity,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
