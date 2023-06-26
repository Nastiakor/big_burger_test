import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:useradgents_exercise/domain/entities/menu_item.dart';

class BurgerApiService {
  Future<List<MenuItem>> fetchBurgerMenu() async {
    final response = await http.get(Uri.parse('https://uad.io/bigburger'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => MenuItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
