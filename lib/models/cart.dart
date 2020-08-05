import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/models/catalog.dart';

// https://github.com/dart-lang/sdk/issues/41571
final cartProvider = ChangeNotifierProvider((ref) => CartModel(ref));

class CartModel extends ChangeNotifier {
  final ProviderReference _ref;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds = [];

  CartModel(this._ref);

  /// The current catalog. Used to construct items from numeric ids.
  CatalogModel get catalog => _ref.read(catalogProvider);

  /// List of items in the cart.
  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  /// The current total price of all items.
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }
}
