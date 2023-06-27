import 'package:useradgents_exercise/domain/entities/menu_item.dart';

class CartItem {
  final MenuItem menuItem;
  int quantity;

  CartItem({required this.menuItem, this.quantity = 0});
}
