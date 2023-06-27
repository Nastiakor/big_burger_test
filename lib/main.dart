import 'package:flutter/material.dart';
import 'package:useradgents_exercise/app/my_app.dart';
import 'package:useradgents_exercise/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<CartProvider>(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}
