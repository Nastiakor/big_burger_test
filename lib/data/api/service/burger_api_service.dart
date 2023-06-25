import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:useradgents_exercise/domain/entities/burger_menu.dart';

class BurgerApiService {
  Future<List<BurgerMenu>> fetchBurgerMenu() async {
    final response = await http.get(Uri.parse('https://uad.io/bigburger'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => BurgerMenu.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
