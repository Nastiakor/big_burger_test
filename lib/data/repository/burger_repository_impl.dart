import 'package:useradgents_exercise/data/api/service/burger_api_service.dart';
import 'package:useradgents_exercise/domain/entities/burger_menu.dart';
import 'package:useradgents_exercise/domain/repository/burger_repository.dart';

class BurgerRepositoryImpl implements BurgerRepository {
  final BurgerApiService apiService;

  BurgerRepositoryImpl({required this.apiService});

  @override
  Future<List<BurgerMenu>> fetchBurgerMenu() {
    return apiService.fetchBurgerMenu();
  }
}
