import 'package:useradgents_exercise/domain/entities/burger_menu.dart';

abstract class BurgerRepository {
  Future<List<BurgerMenu>> fetchBurgerMenu();
}