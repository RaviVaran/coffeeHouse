// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemStruct extends FFFirebaseStruct {
  CartItemStruct({
    DocumentReference? menuitemRef,
    int? quantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _menuitemRef = menuitemRef,
        _quantity = quantity,
        super(firestoreUtilData);

  // "menuitemRef" field.
  DocumentReference? _menuitemRef;
  DocumentReference? get menuitemRef => _menuitemRef;
  set menuitemRef(DocumentReference? val) => _menuitemRef = val;
  bool hasMenuitemRef() => _menuitemRef != null;

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  static CartItemStruct fromMap(Map<String, dynamic> data) => CartItemStruct(
        menuitemRef: data['menuitemRef'] as DocumentReference?,
        quantity: castToType<int>(data['Quantity']),
      );

  static CartItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'menuitemRef': _menuitemRef,
        'Quantity': _quantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'menuitemRef': serializeParam(
          _menuitemRef,
          ParamType.DocumentReference,
        ),
        'Quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static CartItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemStruct(
        menuitemRef: deserializeParam(
          data['menuitemRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['menuItems'],
        ),
        quantity: deserializeParam(
          data['Quantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CartItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartItemStruct &&
        menuitemRef == other.menuitemRef &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => const ListEquality().hash([menuitemRef, quantity]);
}

CartItemStruct createCartItemStruct({
  DocumentReference? menuitemRef,
  int? quantity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartItemStruct(
      menuitemRef: menuitemRef,
      quantity: quantity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartItemStruct? updateCartItemStruct(
  CartItemStruct? cartItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartItemStructData(
  Map<String, dynamic> firestoreData,
  CartItemStruct? cartItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartItem == null) {
    return;
  }
  if (cartItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartItemData = getCartItemFirestoreData(cartItem, forFieldValue);
  final nestedData = cartItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartItemFirestoreData(
  CartItemStruct? cartItem, [
  bool forFieldValue = false,
]) {
  if (cartItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartItem.toMap());

  // Add any Firestore field values
  cartItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartItemListFirestoreData(
  List<CartItemStruct>? cartItems,
) =>
    cartItems?.map((e) => getCartItemFirestoreData(e, true)).toList() ?? [];
