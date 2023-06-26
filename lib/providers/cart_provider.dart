import 'package:flutter/foundation.dart';
import 'package:useradgents_exercise/domain/entities/burger_menu.dart';
import 'package:useradgents_exercise/domain/entities/cart_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(BurgerMenu burgerMenu) {
    var item = _items.firstWhere(
        (item) => item.burgerMenu.ref == burgerMenu.ref,
        orElse: () => CartItem(burgerMenu: burgerMenu));
    if (!_items.contains(item)) {
      _items.add(item);
    }
    item.quantity += 1;
    notifyListeners();
  }

  void removeItem(String ref) {
    _items.removeWhere((item) => item.burgerMenu.ref == ref);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(
        0, (sum, item) => sum + (item.quantity * item.burgerMenu.priceInEuros));
  }
}