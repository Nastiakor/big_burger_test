import 'package:useradgents_exercise/domain/entities/menu_item.dart';
import 'package:useradgents_exercise/domain/entities/cart_item.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  // final GlobalKey<ScaffoldMessengerState> messengerKey =
  //     GlobalKey<ScaffoldMessengerState>();

  List<CartItem> get items => _items;

  void addItem(MenuItem burgerMenu, int quantity, BuildContext context) {
    // check if quantity is more than 0
    if (quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please, add an item to your cart'),
        ),
      );

      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Done!'),
          duration: Duration(seconds: 1),
        ),
      );
    }

    var item = _items.firstWhere((item) => item.menuItem.ref == burgerMenu.ref,
        orElse: () => CartItem(menuItem: burgerMenu));
    if (!_items.contains(item)) {
      _items.add(item);
    }
    item.quantity += quantity;
    notifyListeners();
  }

  void removeItem(String ref) {
    _items.removeWhere((item) => item.menuItem.ref == ref);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(
        0, (sum, item) => sum + (item.quantity * item.menuItem.priceInEuros));
  }

  int get totalItemsCount {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }
}
