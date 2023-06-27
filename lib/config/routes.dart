import 'package:flutter/material.dart';
import 'package:useradgents_exercise/presentation/pages/burger_detail_page.dart';
import 'package:useradgents_exercise/presentation/pages/cart_page.dart';
import 'package:useradgents_exercise/presentation/pages/home_page.dart';
import 'package:useradgents_exercise/domain/entities/menu_item.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => HomePage(),
  '/product-details': (context) => BurgerDetailPage(
      menuItem: ModalRoute.of(context)!.settings.arguments as MenuItem),
  '/cart': (context) => CartPage(),
};