import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<CartItemStruct> _cart = [];
  List<CartItemStruct> get cart => _cart;
  set cart(List<CartItemStruct> _value) {
    _cart = _value;
  }

  void addToCart(CartItemStruct _value) {
    _cart.add(_value);
  }

  void removeFromCart(CartItemStruct _value) {
    _cart.remove(_value);
  }

  void removeAtIndexFromCart(int _index) {
    _cart.removeAt(_index);
  }

  void updateCartAtIndex(
    int _index,
    CartItemStruct Function(CartItemStruct) updateFn,
  ) {
    _cart[_index] = updateFn(_cart[_index]);
  }

  void insertAtIndexInCart(int _index, CartItemStruct _value) {
    _cart.insert(_index, _value);
  }

  double _cartSum = 0.0;
  double get cartSum => _cartSum;
  set cartSum(double _value) {
    _cartSum = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
