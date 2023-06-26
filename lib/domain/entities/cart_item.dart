import 'package:useradgents_exercise/domain/entities/burger_menu.dart';

class CartItem {
  final BurgerMenu burgerMenu;
  int quantity;

  CartItem({required this.burgerMenu, this.quantity = 1});
}
